import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/firestore_collections.dart';
import '../../constants/strings.dart';
import '../../models/goal/goal.dart';
import '../../models/user/user.dart';
import '../onboarding/onboarding_screen.dart';
import 'profile_screens/profile_screen_edit.dart';
import 'profile_screens/profile_screen_goals.dart';
import 'profile_screens/profile_screen_terms.dart';

class ProfileController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  final _user = User.blank().obs;
  final _profilePictureSet = false.obs;

  final _notifications = false.obs;
  final _darkMode = false.obs;

  final _name = ''.obs;
  final _email = ''.obs;

  final _goals = <Goal>[].obs;

  final _errorTextFullName = false.obs;
  final _errorTextEmail = false.obs;
  final _validated = true.obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  User get user => _user.value;

  bool get profilePictureSet => _profilePictureSet.value;

  bool get notifications => _notifications.value;

  bool get darkMode => _darkMode.value;

  String get name => _name.value;

  String get email => _email.value;

  List<Goal> get goals => _goals;

  bool get errorTextFullName => _errorTextFullName.value;

  bool get errorTextEmail => _errorTextEmail.value;

  bool get validated => _validated.value;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set user(User value) => _user.value = value;

  set profilePictureSet(bool value) => _profilePictureSet.value = value;

  set notifications(bool value) => _notifications.value = value;

  set darkMode(bool value) => _darkMode.value = value;

  set name(String value) => _name.value = value;

  set email(String value) => _email.value = value;

  set goals(List<Goal> value) => _goals.assignAll(value);

  set errorTextFullName(bool value) => _errorTextFullName.value = value;

  set errorTextEmail(bool value) => _errorTextEmail.value = value;

  set validated(bool value) => _validated.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  Future<bool> init() async {
    await getCurrentUser();
    await getGoals();

    name = user.name ?? '';
    email = user.email;

    profilePictureSet = user.profilePicture != null;

    notifications =
        storageService.getValue(key: FAStrings.notificationsKey).toString().toLowerCase() == 'true';
    darkMode =
        storageService.getValue(key: FAStrings.darkModeKey).toString().toLowerCase() == 'true';

    return true;
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void goToTerms() => Get.toNamed(ProfileScreenTerms.routeName);

  void goToEditGoals() => Get.toNamed(ProfileScreenGoals.routeName);

  void goToEditProfile() => Get.toNamed(ProfileScreenEdit.routeName);

  /// FUNCTION: Get logged user
  Future<void> getCurrentUser() async {
    if (firebaseService.firebaseUser.value?.uid != null) {
      final userPath =
          '${FCFirestoreCollections.usersCollection}/${firebaseService.firebaseUser.value?.uid}';
      final firebaseUser = await firebaseService.getDocument(docPath: userPath);

      user = User.fromJson(firebaseUser?.data() ?? {});
    }
  }

  /// FUNCTION: Log out
  Future<void> logOut() async {
    await firebaseService.logOut();
    await Get.offAllNamed(OnboardingScreen.routeName);
  }

  /// FUNCTION: Get goal name by id
  String getGoalName(String path) => goals.where((goal) => path.contains(goal.id)).single.name;

  /// FUNCTION: Change checkbox selection
  void changeCheckbox(bool value, int index) {
    var checkedCounter = 0;

    goals[index] = goals[index].copyWith(isChecked: value);

    goals.map((goal) {
      if (goal.isChecked) {
        ++checkedCounter;
      }
    }).toList();

    if (checkedCounter <= 5) {
      _goals.refresh();
    }
    if (checkedCounter == 6) {
      goals[index] = goals[index].copyWith(isChecked: !value);
    }
  }

  /// FUNCTION: Get all goals from firebase
  Future<void> getGoals() async {
    final firebaseGoals =
        await firebaseService.getDocuments(collectionPath: FCFirestoreCollections.goalsCollection);

    if (firebaseGoals == null) {
      return;
    }

    goals = firebaseGoals.docs.map((doc) {
      final goalPath = '${FCFirestoreCollections.goalsCollection}/${doc.id}';

      if (user.userGoals != null && user.userGoals!.contains(goalPath)) {
        return Goal.fromJson({'id': doc.id, 'isChecked': true, ...doc.data()});
      } else {
        return Goal.fromJson({'id': doc.id, 'isChecked': false, ...doc.data()});
      }
    }).toList();

    _goals.refresh();
  }

  /// FUNCTION: Update goals in firebase
  Future<void> updateGoals() async {
    final uid = firebaseService.firebaseUser.value?.uid;

    final selectedGoals = goals
        .where((goal) => goal.isChecked)
        .map((goal) => firebaseService.getDocumentReference(
              collection: FCFirestoreCollections.goalsCollection,
              doc: goal.id,
            ))
        .toList();

    if (uid != null) {
      await firebaseService.updateDoc(
        collection: FCFirestoreCollections.usersCollection,
        doc: uid,
        field: 'userGoals',
        value: selectedGoals,
      );
    }

    await getCurrentUser();
    Get.back();
  }

  void validateFields() {
    /// if field is/was filled show error message (if value is not good)
    if (name.isNotEmpty) {
      errorTextFullName = true;
    }
    if (email.isNotEmpty) {
      errorTextEmail = true;
    }

    /// check validation of all fields
    if (name.isNotEmpty || !email.isEmail) {
      validated = false;
      return;
    }

    validated = true;
  }

  Future<void> uploadPicture({bool isCamera = false}) async {
    final file = await dashboardController.chooseImage(isCamera: isCamera);

    if (user.profilePicture != null) {
      final success = await firebaseService.deleteFile(user.profilePicture!);

      if (!success) {
        Get.snackbar(FAStrings.errorError, 'message');
        return;
      }
    }

    await firebaseService.uploadFile(file: file);
    await getCurrentUser();

    profilePictureSet = firebaseService.urlSet;

    Get.back();
  }

  Future<void> updateUserInfo() async {
    final success =
        await firebaseService.reauthenticate(email: user.email, password: user.password!);

    if (success) {
      final updatedUser = user.copyWith(email: email, name: name);

      // TODO Add try-catch block
      await firebaseService.firebaseUser.value?.updateEmail(updatedUser.email);
      await firebaseService.firebaseUser.value?.updateDisplayName(updatedUser.name);

      // TODO Check success
      final success = await firebaseService.createDoc(
          collection: FCFirestoreCollections.usersCollection,
          doc: updatedUser.id,
          data: updatedUser.toJson());

      user = updatedUser;
    }

    Get.back();
  }

  Future<void> setNotifications() async {
    await storageService.deleteValue(key: FAStrings.notificationsKey);
    await storageService.insertValue(key: FAStrings.notificationsKey, value: notifications);

    if(notifications){
      await firebaseService.firebaseMessaging.subscribeToTopic('lectures');
    } else {
      await firebaseService.firebaseMessaging.unsubscribeFromTopic('lectures');
    }
  }

  Future<void> setDarkMode() async {
    await storageService.deleteValue(key: FAStrings.darkModeKey);
    await storageService.insertValue(key: FAStrings.darkModeKey, value: darkMode);
  }
}
