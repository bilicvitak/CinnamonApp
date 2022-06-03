import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/dependencies.dart';
import '../constants/strings.dart';
import '../models/seat/seat.dart';
import '../models/user/user.dart' as cinnamon_user;

class FirebaseService extends GetxService {
  static final instance = Get.find<FirebaseService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late FirebaseAuth _firebaseAuth;
  late FirebaseFirestore _firebaseFirestore;
  late FirebaseStorage _firebaseStorage;

  late Rx<User?> firebaseUser;
  late StreamSubscription<User?> userChanges;

  String usersCollection = 'users'; // name of collection that stores users
  String goalsCollection = 'goals'; // name of collection that stores goals
  String lessonsCollection = 'lectures'; // name of collection that stores lessons
  String lessonRatingsCollection = 'lessonRatings'; // name of collection that stores lesson ratings
  String seatsCollection = 'seats'; // name of collection that stores seats
  String reservationsCollection = 'reservations'; // name of collection that stores reservations
  String notificationsCollection = 'notifications'; // name of collection that store notifications

  final _profilePictureUrl = ''.obs; // url of users profile picture
  final _urlSet = false.obs; // confirm if url from firebase storage is valid

  /// ------------------------
  /// GETTERS
  /// ------------------------

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  FirebaseFirestore get firebaseFirestore => _firebaseFirestore;

  FirebaseStorage get firebaseStorage => _firebaseStorage;

  bool get urlSet => _urlSet.value;

  String get profilePictureUrl => _profilePictureUrl.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set firebaseAuth(FirebaseAuth value) => _firebaseAuth = value;

  set firebaseFirestore(FirebaseFirestore value) => _firebaseFirestore = value;

  set firebaseStorage(FirebaseStorage value) => _firebaseStorage = value;

  set urlSet(bool value) => _urlSet.value = value;

  set profilePictureUrl(String value) => _profilePictureUrl.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  void onInit() {
    super.onInit();

    firebaseAuth = FirebaseAuth.instance;
    firebaseFirestore = FirebaseFirestore.instance;
    firebaseStorage = FirebaseStorage.instance;
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.userChanges());
  }

  @override
  Future<void> onClose() async {
    await userChanges.cancel();
    super.onClose();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// FUNCTION: user logged in

  void userLogged() {
    userChanges = firebaseAuth.userChanges().listen(
      (user) {
        if (user == null) {
          Get.snackbar('Message:', 'User is currently signed out!');
        } else {
          Get.snackbar(user.email!, 'User is signed in!');
        }
      },
    );
  }

  /// FUNCTION:  register new user

  Future<bool> signUp(String email, String password) async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) => {
                firebaseFirestore.collection(usersCollection).doc(result.user?.uid).set({
                  'name': registrationController.fullName,
                  'id': result.user?.uid,
                  'email': registrationController.email,
                  'password': registrationController.password,
                  'profilePicture': '',
                })
              });
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar('Error:', 'The account already exists for that email.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Registration fail');
    }

    return false;
  }

  /// FUNCTION: Validate new account

  Future<bool> validateAccount(String code, String userId) async {
    try {
      final snapshot = await firebaseFirestore.collection(usersCollection).doc(userId).get();

      var user = cinnamon_user.User.fromJson(snapshot.data() ?? {});

      if (user.code == code) {
        user = user.copyWith(codeIsVerified: true);
        await firebaseFirestore.collection(usersCollection).doc(userId).set(user.toJson());

        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      logger.e(e.message.toString());
    }

    return false;
  }

  ///  FUNCTION: sign in existing user

  Future<bool> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      }
    }

    return false;
  }

  /// FUNCTION: change password and update database

  Future<bool> changePassword(String email, String newPassword, String userId) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      await currentUser?.updatePassword(newPassword);
      final credential = EmailAuthProvider.credential(email: email, password: newPassword);

      await currentUser!.reauthenticateWithCredential(credential);

      await firebaseFirestore
          .collection(usersCollection)
          .doc(userId)
          .update({'password': newPassword});

      return true;
    } on FirebaseAuthException catch (e) {
      logger.e(e);
      Get.snackbar('Error', 'Password reset fail.');
    }

    return false;
  }

  /// FUNCTION: upload file to Firebase Firestore

  Future<void> uploadFile({File? file}) async {
    if (file == null) {
      Get.snackbar('Message', 'No picture selected');
      return;
    }

    /// get user and user id and set it as image name

    final currentUser = firebaseAuth.currentUser;
    var currentUserId = '';
    if (currentUser != null) {
      currentUserId = currentUser.uid;
    }

    /// get user profile picture url
    try {
      await firebaseStorage.ref('uploads/$currentUserId').putFile(file);
      await downloadFile();
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// FUNCTION: download file

  Future<void> downloadFile() async {
    /// get user and user id

    final currentUser = firebaseAuth.currentUser;
    var currentUserId = '';
    if (currentUser != null) {
      currentUserId = currentUser.uid;
    }

    /// get profile picture url with current user id and update url in base

    final ref = firebaseStorage.ref().child('uploads/$currentUserId');
    profilePictureUrl = await ref.getDownloadURL();

    await firebaseFirestore
        .collection(usersCollection)
        .doc(currentUserId)
        .update({'profilePicture': profilePictureUrl});
    urlSet = true;
  }

  /// FUNCTION: delete file

  Future<void> deleteFile(String url) async {
    try {
      await firebaseStorage.refFromURL(url).delete();
    } on FirebaseException catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  /// FUNCTION: Log out user

  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  /// FUNCTION: get document by relative path

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({required String docPath}) async {
    final doc = await firebaseFirestore.doc(docPath).get();
    return doc;
  }

  /// FUNCTION: get all documents in collection

  Future<QuerySnapshot<Map<String, dynamic>>> getDocuments({required String collectionPath}) async {
    final collection = await firebaseFirestore.collection(collectionPath).get();

    return collection;
  }

  /// FUNCTION: get all lessons from Firebase

  Future<List<Map<String, dynamic>>> getLessons() async {
    final firebaseLessons = await firebaseFirestore.collection(lessonsCollection).get();
    final lessonsData = firebaseLessons.docs.map((doc) => doc.data()).toList();

    return lessonsData;
  }

  /// FUNCTION: get all seats from Firebase

  Future<List<Seat>> getSeats() async {
    final firebaseSeats = await firebaseFirestore.collection(seatsCollection).get();

    final seats = firebaseSeats.docs.map((doc) {
      final result = {'seatId': doc.id, ...doc.data()};
      return Seat.fromJson(result);
    });

    return seats.toList();
  }

  /// FUNCTION: get reservations from Firebase

  Future<List<Map<String, dynamic>>> getReservations() async {
    final firebaseReservations = await firebaseFirestore.collection(reservationsCollection).get();
    final reservationsData = firebaseReservations.docs.map((doc) => doc.data()).toList();

    return reservationsData;
  }

  /// FUNCTION: Generic function for updating document

  Future<void> updateDoc({
    required String collection,
    required String doc,
    required String field,
    required value,
  }) async {
    await firebaseFirestore.collection(collection).doc(doc).update({field: value});
  }

  /// FUNCTION: Get document reference by id

  DocumentReference<Map<String, dynamic>> getDocumentReference(
          {required String collection, required String doc}) =>
      firebaseFirestore.collection(collection).doc(doc);

  /// FUNCTION: Get collection reference by id

  CollectionReference<Map<String, dynamic>> getCollectionReference({required String collection}) =>
      firebaseFirestore.collection(collection);

  /// FUNCTION: Save file to local folder

  Future<String?> saveFile(String url, String name) async {
    final ref = firebaseStorage.refFromURL(url);
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.absolute.path}/$name';
    final file = File(filePath);

    try {
      await ref.writeToFile(file);
      return filePath;
    } on FirebaseException catch (e) {
      Get.snackbar('Download error', '$e');
    }

    return null;
  }
}
