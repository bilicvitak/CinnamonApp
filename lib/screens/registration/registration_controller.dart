import 'package:get/get.dart';

import '../../constants/dependencies.dart';
import '../../constants/errors.dart';
import '../../constants/firestore_collections.dart';
import '../../constants/strings.dart';
import '../../models/goal/goal.dart';
import '../../services/firebase_service.dart';
import '../login/login_screen.dart';
import '../main_screen.dart';
import 'registration_screens/registration_screen_code.dart';
import 'registration_screens/registration_screen_finish.dart';
import 'registration_screens/registration_screen_goals.dart';
import 'registration_screens/registration_screen_notifications.dart';
import 'registration_screens/registration_screen_profile_picture.dart';

class RegistrationController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  var baseUrl = 'https://us-central1-cinnamonapp-73a64.cloudfunctions.net/sendEmailAgain?userId=';

  /// enable yellow button
  final _validated = false.obs; //password check
  final _codeVerified = false.obs; // code verification check
  final _profilePictureSet = false.obs; //profile picture is set
  final _tasksChosen = false.obs; // max 5 tasks choosen
  final _emailAlreadyInUse = false.obs; //check if email is already been used

  /// hide/see password
  final _obscureText = true.obs;

  /// user info
  final _fullName = ''.obs;
  final _email = ''.obs;
  final _password = ''.obs;

  /// error info
  final _errorTextFullName = false.obs;
  final _errorTextEmail = false.obs;
  final _errorTextPassword = false.obs;

  /// code verification
  final _code = ''.obs;

  final _goals = <Goal>[].obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  bool get validated => _validated.value;

  bool get codeVerified => _codeVerified.value;

  bool get profilePictureSet => _profilePictureSet.value;

  bool get tasksChosen => _tasksChosen.value;

  bool get emailAlreadyInUse => _emailAlreadyInUse.value;

  bool get obscureText => _obscureText.value;

  String get fullName => _fullName.value;

  String get email => _email.value;

  String get password => _password.value;

  bool get errorTextFullName => _errorTextFullName.value;

  bool get errorTextEmail => _errorTextEmail.value;

  bool get errorTextPassword => _errorTextPassword.value;

  String get code => _code.value;

  List<Goal> get goals => _goals;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set validated(bool value) => _validated.value = value;

  set codeVerified(bool value) => _codeVerified.value = value;

  set profilePictureSet(bool value) => _profilePictureSet.value = value;

  set tasksChosen(bool value) => _tasksChosen.value = value;

  set emailAlreadyInUse(bool value) => _emailAlreadyInUse.value = value;

  set obscureText(bool value) => _obscureText.value = value;

  set fullName(String value) => _fullName.value = value;

  set email(String value) => _email.value = value;

  set password(String value) => _password.value = value;

  set errorTextFullName(bool value) => _errorTextFullName.value = value;

  set errorTextEmail(bool value) => _errorTextEmail.value = value;

  set errorTextPassword(bool value) => _errorTextPassword.value = value;

  set code(String value) => _code.value = value;

  set goals(List<Goal> value) => _goals.assignAll(value);

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    goals = await _getGoals();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// reg. code screen -> reg. profile picture screen
  void goToProfile() {
    Get.toNamed(RegistrationScreenProfilePicture.routeName);
  }

  /// reg. profile picture screen -> reg. goals screen
  void goToGoals() {
    if (profilePictureSet) {
      Get.toNamed(RegistrationScreenGoals.routeName);
    }
  }

  /// reg. goals screen -> reg. notifications screen
  void goToNotifications() {
    if (tasksChosen) {
      Get.toNamed(RegistrationScreenNotifications.routeName);
    }
  }

  /// reg. notifications screen -> reg. finish screen
  void goToFinish() {
    Get.toNamed(RegistrationScreenFinish.routeName);
  }

  /// reg. finish screen -> login/main screen
  void start() {
    if (firebaseService.firebaseUser.value == null) {
      Get.toNamed(LoginScreen.routeName);
    } else {
      Get.toNamed(MainScreen.routeNameTransition);
    }
  }

  /// FUNCTION: Create user and go to next screen
  Future<void> signUp() async {
    if (validated) {
      final resultCode =
          await firebaseService.signUp(email: email, password: password, fullName: fullName);

      switch (resultCode) {
        case 0:
          await Get.toNamed(RegistrationScreenCode.routeName);
          break;
        case FCErrors.emailInUse:
          Get.snackbar(FAStrings.errorError, FAStrings.errorEmailInUse);
          break;
        case FCErrors.registrationFail:
          Get.snackbar(FAStrings.errorError, FAStrings.errorRegistrationFail);
          break;
      }
    }
  }

  /// FUNCTION: check registration fields
  void validateFields() {
    /// if field is/was filled show error message (if value is not good)
    if (fullName.isNotEmpty) {
      errorTextFullName = true;
    }
    if (email.isNotEmpty) {
      errorTextEmail = true;
    }
    if (password.isNotEmpty) {
      errorTextPassword = true;
    }

    /// check validation of all fields
    if (fullName.isEmpty ||
            !email.isEmail ||
            password.length < 6 ||
            !password.contains(RegExp('[0-9]'))
        // || emailAlreadyInUse
        ) {
      validated = false;
      return;
    }
    validated = true;
  }

  /// FUNCTION: Show/hide password
  void showPassword() => obscureText = !obscureText;

  /// FUNCTION: Validate account by code
  Future<void> validateAccount() async {
    final userId = firebaseService.firebaseUser.value?.uid ?? '0';
    final resultCode = await firebaseService.validateAccount(code: code, userId: userId);

    switch (resultCode) {
      case 0:
        codeVerified = true;
        break;
      case FCErrors.wrongCode:
        Get.snackbar(FAStrings.errorError, FAStrings.errorWrongCode);
        break;
      case FCErrors.validationFail:
        Get.snackbar(FAStrings.errorError, FAStrings.errorValidationFail);
        break;
    }
  }

  /// FUNCTION: Change (un)checked goals
  void changeCheckbox(bool value, int index) {
    var checkedCounter = 0;

    goals[index] = goals[index].copyWith(isChecked: value);

    goals.map((goal) {
      if (goal.isChecked) {
        ++checkedCounter;
      }
    }).toList();

    /// enable button if any task is chosen
    tasksChosen = checkedCounter > 0;

    if (checkedCounter <= 5) {
      _goals.refresh();
    }
    if (checkedCounter == 6) {
      goals[index] = goals[index].copyWith(isChecked: !value);
    }
  }

  /// FUNCTION: Resend email
  Future<void> resendEmail() async {
    final uid = firebaseService.firebaseUser.value?.uid;

    if (uid != null) {
      final data = baseUrl + uid;
      await dioService.getURL(Uri.parse(data).toString());
    } else {
      Get.snackbar(FAStrings.errorError, FAStrings.errorResendEmail);
    }

    Get.back(); // Close dialog after sending email
  }

  /// FUNCTION: Send code via SMS
  void sendSMS() {
    Get
      ..snackbar('Service unavailable', 'SMS verification not available')
      ..back();
  }

  /// FUNCTION: Upload profile picture
  Future<void> uploadPicture({bool isCamera = false}) async {
    final file = await dashboardController.chooseImage(isCamera: isCamera);
    final resultCode = await firebaseService.uploadFile(file: file);

    switch (resultCode) {
      case 0:
        profilePictureSet = firebaseService.urlSet;
        break;
      case FCErrors.picturNotSelected:
        Get.snackbar(FAStrings.errorError, FAStrings.errorPictureNotSelected);
        break;
      case FCErrors.uploadFileFail:
        Get.snackbar(FAStrings.errorError, FAStrings.errorUploadFileFail);
        break;
    }

    Get.back();
  }

  /// FUNCTION: Get all goals from firebase
  Future<List<Goal>> _getGoals() async {
    final firebaseGoals =
        await firebaseService.getDocuments(collectionPath: FCFirestoreCollections.goalsCollection);

    if (firebaseGoals != null) {
      return firebaseGoals.docs
          .map((doc) => Goal.fromJson({'id': doc.id, 'isChecked': false, ...doc.data()}))
          .toList();
    }

    Get.snackbar(FAStrings.errorError, FAStrings.errorNoGoals);

    return [Goal(id: '1', name: 'Goal 1', isChecked: true)];
  }

  /// FUNCTION: Update user's goals in firebase
  Future<void> setGoals() async {
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
  }

  Future<void> allowNotifications() async {
    await storageService.deleteValue(key: FAStrings.notificationsKey);
    await storageService.insertValue(key: FAStrings.notificationsKey, value: true);

    goToFinish();
  }
}
