import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/dependencies.dart';
import '../constants/errors.dart';
import '../constants/firestore_collections.dart';
import '../main.dart';
import '../models/user/user.dart' as cinnamon_user;

class FirebaseService extends GetxService {
  static final instance = Get.find<FirebaseService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late FirebaseAuth firebaseAuth;
  late FirebaseFirestore firebaseFirestore;
  late FirebaseStorage firebaseStorage;
  late FirebaseMessaging firebaseMessaging;

  late Rx<User?> firebaseUser;
  late StreamSubscription<User?> userChanges;

  final _profilePictureUrl = ''.obs; // url of users profile picture
  final _urlSet = false.obs; // confirm if url from firebase storage is valid

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get urlSet => _urlSet.value;

  String get profilePictureUrl => _profilePictureUrl.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

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
    firebaseMessaging = FirebaseMessaging.instance;

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

  /// FUNCTION: register new user
  Future<int> signUp(
      {required String email, required String password, required String fullName}) async {
    try {
      final result =
          await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (result.user != null) {
        await createDoc(
            collection: FCFirestoreCollections.usersCollection,
            doc: result.user!.uid,
            data: {
              'name': fullName,
              'id': result.user!.uid,
              'email': email,
              'password': password,
              'profilePicture': null
            });
      } else {
        return FCErrors.registrationFail;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        logger.e(e.message);
        return FCErrors.emailInUse;
      }
    } catch (e) {
      logger.e(e);
      return FCErrors.registrationFail;
    }

    return 0;
  }

  /// FUNCTION: Validate new account
  Future<int> validateAccount({required String code, required String userId}) async {
    final docPath = '${FCFirestoreCollections.usersCollection}/$userId';

    try {
      final snapshot = await getDocument(docPath: docPath);
      var user = cinnamon_user.User.fromJson(snapshot?.data() ?? {'id': '', 'email': ''});

      if (user.code == code) {
        user = user.copyWith(codeIsVerified: true);

        await updateDoc(
            collection: FCFirestoreCollections.usersCollection,
            doc: userId,
            field: 'codeIsVerified',
            value: true);
      } else {
        return FCErrors.wrongCode;
      }
    } on FirebaseException catch (e) {
      logger.e(e.message);
      return FCErrors.validationFail;
    } catch (e) {
      logger.e(e);
      return FCErrors.validationFail;
    }

    return 0;
  }

  ///  FUNCTION: sign in existing user
  Future<int> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.e(e.message);
        return FCErrors.userNotFound;
      } else if (e.code == 'wrong-password') {
        logger.e(e.message);
        return FCErrors.wrongPassword;
      }
    } catch (e) {
      logger.e(e);
      return FCErrors.loginFail;
    }

    return 0;
  }

  /// FUNCTION: change password and update database
  Future<bool> changePassword(String email, String newPassword, String userId) async {
    try {
      final currentUser = firebaseAuth.currentUser;
      await currentUser?.updatePassword(newPassword);
      final credential = EmailAuthProvider.credential(email: email, password: newPassword);

      await currentUser!.reauthenticateWithCredential(credential);

      final success = await updateDoc(
          collection: FCFirestoreCollections.usersCollection,
          doc: userId,
          field: 'password',
          value: newPassword);

      return success;
    } on FirebaseAuthException catch (e) {
      logger.e(e);
    } catch (e) {
      logger.e(e);
    }

    return false;
  }

  /// FUNCTION: upload file to Firebase Firestore
  Future<int> uploadFile({File? file}) async {
    if (file == null) {
      return FCErrors.picturNotSelected;
    }

    /// get user and user id and set it as image name
    final userId = firebaseUser.value?.uid;

    /// get user profile picture url
    if (userId != null) {
      try {
        await firebaseStorage.ref('uploads/$userId').putFile(file);
        await downloadFile();
      } on FirebaseException catch (e) {
        logger.e(e.message);
        return FCErrors.uploadFileFail;
      } catch (e) {
        logger.e(e);
        return FCErrors.uploadFileFail;
      }
    } else {
      return FCErrors.uploadFileFail;
    }

    return 0;
  }

  /// FUNCTION: download file
  Future<void> downloadFile() async {
    try {
      final userId = firebaseUser.value?.uid ?? '0';
      final ref = firebaseStorage.ref().child('uploads/$userId');
      profilePictureUrl = await ref.getDownloadURL();

      urlSet = await updateDoc(
          collection: FCFirestoreCollections.usersCollection,
          doc: userId,
          field: 'profilePicture',
          value: profilePictureUrl);
    } catch (e) {
      logger.e(e);
    }
  }

  /// FUNCTION: delete file
  Future<bool> deleteFile(String url) async {
    try {
      await firebaseStorage.refFromURL(url).delete();
      return true;
    } on FirebaseException catch (e) {
      logger.e(e.message);
    } catch (e) {
      logger.e(e);
    }

    return false;
  }

  /// FUNCTION: Log out user
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  /// FUNCTION: get document by relative path
  Future<DocumentSnapshot<Map<String, dynamic>>?> getDocument({required String docPath}) async {
    try {
      final doc = await firebaseFirestore.doc(docPath).get();
      return doc;
    } on FirebaseException catch (e) {
      logger.e(e.message);
    }

    return null;
  }

  /// FUNCTION: get all documents in collection
  Future<QuerySnapshot<Map<String, dynamic>>?> getDocuments(
      {required String collectionPath}) async {
    try {
      final collection = await firebaseFirestore.collection(collectionPath).get();
      return collection;
    } on FirebaseException catch (e) {
      logger.e(e.message);
    }

    return null;
  }

  /// FUNCTION: Generic function for updating document
  Future<bool> updateDoc({
    required String collection,
    required String doc,
    required String field,
    required value,
  }) async {
    try {
      await firebaseFirestore.collection(collection).doc(doc).update({field: value});
      return true;
    } on FirebaseException catch (e) {
      logger.e(e.message);
    } catch (e) {
      logger.e(e);
    }

    return false;
  }

  /// FUNCTION: Create or update document by id
  Future<bool> createDoc(
      {required String collection, String? doc, required Map<String, dynamic> data}) async {
    try {
      if (doc != null) {
        await firebaseFirestore.collection(collection).doc(doc).set(data);
      } else {
        await firebaseFirestore.collection(collection).add(data);
      }
      return true;
    } catch (e) {
      logger.e(e);
    }

    return false;
  }

  /// FUNCTION: Get document reference by id
  DocumentReference<Map<String, dynamic>> getDocumentReference(
      {required String doc, String? collection}) {
    if (collection != null) {
      return firebaseFirestore.collection(collection).doc(doc);
    } else {
      return firebaseFirestore.doc(doc);
    }
  }

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
      logger.e(e.message);
    }

    return null;
  }

  /// FUNCTION: Get reference name
  String getRefFromUrl(String url) {
    final ref = firebaseStorage.refFromURL(url);
    return ref.name;
  }

  Future<bool> reauthenticate({required String email, required String password}) async {
    final credential = EmailAuthProvider.credential(email: email, password: password);

    try {
      final result = await firebaseUser.value?.reauthenticateWithCredential(credential);
      return result != null;
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
    }

    return false;
  }
}
