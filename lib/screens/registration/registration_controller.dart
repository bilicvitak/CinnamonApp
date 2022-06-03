
import 'package:get/get.dart';

import '../../constants/dependencies.dart';
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
  static final instance = Get.find<RegistrationController>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  var baseUrl = 'https://us-central1-flutteracademia.cloudfunctions.net/sendEmailAgain?userId=';

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

  /// registration screen -> reg. code screen
  Future<void> goToCreateCode() async {
    if (validated) {
      final success = await FirebaseService.instance.signUp(email, password);

      if (success) {
        await Get.toNamed(RegistrationScreenCode.routeName);
      }
    }
  }

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

  void start() {
    if (firebaseService.firebaseUser.value == null) {
      Get.toNamed(LoginScreen.routeName);
    } else {
      Get.toNamed(MainScreen.routeNameTransition);
    }
  }

  /// ------------------------

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
    final uid = firebaseService.firebaseUser.value?.uid;

    if (uid != null) {
      final validationSuccess = await firebaseService.validateAccount(code, uid);

      validationSuccess
          ? codeVerified = true
          : Get.snackbar('Error', 'Account validation not successful');
    }
  }

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
    }

    Get.back(); // Close dialog after sending email
  }

  /// FUNCTION: Send code via SMS
  void sendSMS() {
    logger.wtf('Sending code to phone...');
    Get.back();
  }

  Future<void> uploadPicture({bool isCamera = false}) async {
    final file = await dashboardController.chooseImage(isCamera: isCamera);
    await firebaseService.uploadFile(file: file);

    profilePictureSet = firebaseService.urlSet;

    Get.back();
  }

  /// FUNCTION: Get all goals from firebase
  Future<List<Goal>> _getGoals() async {
    final firebaseGoals =
        await firebaseService.getDocuments(collectionPath: firebaseService.goalsCollection);

    return firebaseGoals.docs
        .map((doc) => Goal.fromJson({'id': doc.id, 'isChecked': false, ...doc.data()}))
        .toList();
  }

  Future<void> setGoals() async {
    final uid = firebaseService.firebaseUser.value?.uid;
    final selectedGoals = goals
        .where((goal) => goal.isChecked)
        .map((goal) => firebaseService.getDocumentReference(
              collection: firebaseService.goalsCollection,
              doc: goal.id,
            ))
        .toList();

    if (uid != null) {
      await firebaseService.updateDoc(
        collection: firebaseService.usersCollection,
        doc: uid,
        field: 'userGoals',
        value: selectedGoals,
      );
    }
  }
}
