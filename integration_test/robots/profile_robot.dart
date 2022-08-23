import 'package:cinnamon_flutter_template_1/constants/dependencies.dart';
import 'package:cinnamon_flutter_template_1/constants/keys.dart';
import 'package:cinnamon_flutter_template_1/constants/strings.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_back_button.dart';
import 'package:cinnamon_flutter_template_1/widgets/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class ProfileRobot {
  final WidgetTester _tester;

  ProfileRobot(this._tester);

  /// Profile screen
  Future<void> findProfileSettings() async {
    final editButton = find.widgetWithText(GestureDetector, FAStrings.profileEdit);
    expect(editButton, findsNWidgets(2));

    await findUserInfo();
    await findUserGoals();
    await findSettings();
  }

  Future<void> findUserInfo(
      {String fullName = 'Iva Papac', String email = 'ivapapac22@gmail.com'}) async {
    final infoTitle = find.text(FAStrings.profileInfo);
    final profilePicture = find.byKey(FAKeys.profilePicture);
    final fullNameFinder = find.text(fullName);
    final emailFinder = find.text(email);

    expect(infoTitle, findsOneWidget);
    expect(profilePicture, findsOneWidget);
    expect(fullNameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  }

  Future<void> findUserGoals({bool goalsEmpty = false}) async {
    final goalsTitle = find.text(FAStrings.profileGoals);
    final goalsContainer = find.byKey(FAKeys.profileGoalsContainer);
    final goalsList = find.byKey(FAKeys.profileGoalsList);
    final noGoalsText = find.text(FAStrings.profileNoGoals);

    expect(goalsTitle, findsOneWidget);
    expect(goalsContainer, findsOneWidget);

    if (goalsEmpty) {
      expect(goalsList, findsNothing);
      expect(noGoalsText, findsOneWidget);
    } else {
      expect(goalsList, findsOneWidget);
      expect(noGoalsText, findsNothing);
    }
  }

  Future<void> findSettings() async {
    final settingsTitle = find.text(FAStrings.profileSettings);
    final notificationsText = find.text(FAStrings.profileNotifications);
    final notificationsButton = find.byKey(FAKeys.profileNotificationsToggle);
    final darkModeText = find.text(FAStrings.profileDarkMode);
    final darkModeToggle = find.byKey(FAKeys.profileDarkModeToggle);
    final termsText = find.text(FAStrings.profileTermsCo);
    final logOutText = find.text(FAStrings.profileLogOut);

    expect(settingsTitle, findsOneWidget);
    expect(notificationsText, findsOneWidget);
    expect(notificationsButton, findsOneWidget);
    expect(darkModeText, findsOneWidget);
    expect(darkModeToggle, findsOneWidget);
    expect(termsText, findsOneWidget);
    expect(logOutText, findsOneWidget);
  }

  Future<void> clickEditButton({int index = 0}) async {
    final editButton = find.widgetWithText(GestureDetector, FAStrings.profileEdit).at(index);

    await _tester.tap(editButton);
    await _tester.pumpAndSettle();
  }

  Future<void> toggleNotifications() async {
    final notificationsButton = find.byKey(FAKeys.profileNotificationsToggle);
    final notificationsOn = storageService.getValue(key: FAStrings.notificationsKey);
    final notificationsIcon = notificationsOn
        ? find.byKey(FAKeys.profileNotificationsOff)
        : find.byKey(FAKeys.profileNotificationsOn);

    await _tester.tap(notificationsButton);
    await _tester.pump(const Duration(milliseconds: 500));

    expect(notificationsIcon, findsOneWidget);
  }

  Future<void> toggleDarkMode() async {
    final darkModeButton = find.byKey(FAKeys.profileDarkModeToggle);
    final darkModeOn = storageService.getValue(key: FAStrings.darkModeKey);
    final darkModeIcon =
        darkModeOn ? find.byKey(FAKeys.profileDarkModeOff) : find.byKey(FAKeys.profileDarkModeOn);

    await _tester.tap(darkModeButton);
    await _tester.pump(const Duration(milliseconds: 500));

    expect(darkModeIcon, findsOneWidget);
  }

  Future<void> clickTerms() async {
    final termsText = find.text(FAStrings.profileTermsCo);

    await _tester.tap(termsText);
    await _tester.pumpAndSettle();
  }

  Future<void> signOut() async {
    final logOutText = find.text(FAStrings.profileLogOut);

    await _tester.tap(logOutText);
    await _tester.pumpAndSettle(const Duration(seconds: 5));

    final firebaseUser = firebaseService.firebaseUser.value;
    expect(firebaseUser == null, true);
  }

  /// Edit user info
  Future<void> editProfilePicture() async {
    /// TODO Implement this method
  }

  Future<void> editName({String name = ''}) async {
    final fullNameEdit = find.byKey(FAKeys.profileEditFullName);
    final fullNameEmpty = find.text(FAStrings.registrationValidationRequiredField);

    await _tester.tap(fullNameEdit);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(fullNameEdit, name);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(seconds: 1));

    final saveButton =
        _tester.widget<YellowButton>(find.widgetWithText(YellowButton, FAStrings.buttonSave));

    name.isEmpty ? expect(fullNameEmpty, findsOneWidget) : expect(fullNameEmpty, findsNothing);
    expect(saveButton.enabled, name.isNotEmpty);
  }

  Future<void> editEmail({String email = ''}) async {
    final emailEdit = find.byKey(FAKeys.profileEditEmail);

    await _tester.tap(emailEdit);
    await _tester.pump(const Duration(milliseconds: 500));
    await _tester.enterText(emailEdit, email);
    await _tester.pump(const Duration(seconds: 1));

    FocusManager.instance.primaryFocus?.unfocus();
    await _tester.pump(const Duration(milliseconds: 500));

    final emailEmpty = find.text(FAStrings.registrationValidationRequiredField);
    final emailInvalid = find.text(FAStrings.registrationValidationValidEmail);
    final saveButton =
        _tester.widget<YellowButton>(find.widgetWithText(YellowButton, FAStrings.buttonSave));

    if (email.isEmpty) {
      expect(emailEmpty, findsOneWidget);
    } else if (!email.isEmail) {
      expect(emailInvalid, findsOneWidget);
    } else {
      expect(emailEmpty, findsNothing);
      expect(emailInvalid, findsNothing);
    }

    expect(saveButton.enabled, email.isNotEmpty && email.isEmail);
  }

  Future<void> clickSaveButton() async {
    final saveButton = find.widgetWithText(YellowButton, FAStrings.buttonSave);

    await _tester.tap(saveButton);
    await _tester.pumpAndSettle(const Duration(seconds: 5));
  }

  /// Edit goals
  Future<void> clickGoals({bool isSelecting = true}) async {
    final checkboxes = find.byType(CheckboxListTile);
    final length = checkboxes.evaluate().length;

    for (var i = 0; i < length; i++) {
      final checkboxWidget = _tester.widget<CheckboxListTile>(checkboxes.at(i));
      final isSelectedBefore = _tester.widget<CheckboxListTile>(checkboxes.at(i)).value!;

      if ((isSelecting && !isSelectedBefore) || (!isSelecting && isSelectedBefore)) {
        await _tester.tap(checkboxes.at(i));
        await _tester.pump();
      }

      final isSelectedAfter = _tester.widget<CheckboxListTile>(checkboxes.at(i)).value;
      expect(isSelectedAfter, isSelecting);
    }
  }

  Future<void> scrollGoals({AxisDirection direction = AxisDirection.up}) async {
    final goalsList = find.byKey(FAKeys.profileGoalsList);
    final goalsContainer = find.byKey(FAKeys.profileGoalsContainer);
    final firstGoal = find.descendant(of: goalsContainer, matching: find.byType(Text)).first;
    final dy = direction == AxisDirection.up ? -500.0 : 500.0;
    final initialPosition = _tester.getCenter(firstGoal);

    await _tester.drag(goalsList, Offset(0, dy));
    await _tester.pump(const Duration(milliseconds: 500));

    final newPosition = _tester.getCenter(firstGoal);

    expect(newPosition.dy < initialPosition.dy, direction == AxisDirection.up);
  }

  /// Profile Terms screen
  Future<void> findTerms() async {
    final termsTitle = find.descendant(
        of: find.byKey(FAKeys.profileTermsScrollView),
        matching: find.text(FAStrings.profileTermsCo));
    final termsText = find.text(FAStrings.profileTermsText);

    expect(termsTitle, findsOneWidget);
    expect(termsText, findsOneWidget);
  }

  Future<void> findPrivacyPolicy() async {
    final privacyPolicyTitle = find.text(FAStrings.profilePrivacyPolicy);
    final privacyPolicyText = find.text(FAStrings.profilePrivacyPolicyText);

    expect(privacyPolicyTitle, findsOneWidget);
    expect(privacyPolicyText, findsOneWidget);
  }

  Future<void> goBack() async {
    final yellowBackButton = find.byType(YellowBackButton);

    await _tester.tap(yellowBackButton);
    await _tester.pumpAndSettle();
  }

  Future<void> scrollTermsPage({AxisDirection direction = AxisDirection.up}) async {
    final scrollView = find.byKey(FAKeys.profileTermsScrollView);
    final dy = direction == AxisDirection.up ? -500.0 : 500.0;
    final termsTitle = find.descendant(
        of: find.byKey(FAKeys.profileTermsScrollView),
        matching: find.text(FAStrings.profileTermsCo));
    final initialPosition = _tester.getCenter(termsTitle);

    await _tester.drag(scrollView, Offset(0, dy));
    await _tester.pump();

    final newPosition = _tester.getCenter(termsTitle);

    expect(newPosition.dy < initialPosition.dy, direction == AxisDirection.up);
  }
}
