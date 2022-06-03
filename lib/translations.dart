import 'package:get/get.dart';

class FATranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'helloWorld': 'Hello world!',
          'appName': 'Cinnamon app',
          'folderName': 'CinnamonApp',

          // onboarding:
          'onboardingFirstText': 'Get an overview of the lessons and schedule',
          'onboardingSecondText': 'Reserve your seat',
          'onboardingThirdText': 'Leave your feedback and rate the lessons',
          'onboardingFourthText': 'Stay up-to-date with notifications and reminders',

          // registration:
          //------- headline
          'registrationEnterCode': 'Enter a Code',
          'registrationCreateAccount': 'Create an Account',
          'registrationCompleteProfile': 'Complete your profile',
          'registrationGoals': 'Goals',
          'registrationNotifications': 'Notifications',

          //------- description
          'registrationCodeSent': 'We sent you a code to @email. Please enter it below.',
          'registrationMailNotSent': "Didn't recieve email?",
          'registrationPickGoals': 'Pick up to 5 goals you want to accomplish in this academy.',
          'registrationReminders':
              'FA22 would like to send you notifications and reminders about lessons.',
          'registrationUploadProfilePicture': 'Upload profile picture',
          'registrationFinishIn': 'You are in!',
          'registrationWelcomeToCFA': 'Welcome to Cinnamon Flutter Academy.',

          //------- validation fields
          'registrationValidationFullName': 'Full Name',
          'registrationValidationEmail': 'E-mail',
          'registrationValidationPassword': 'Password',
          'registrationValidationRequiredField': 'Required field',
          'registrationValidationValidEmail': 'Enter a valid email address',
          'registrationValidationShortPassword':
              'Password must be at least 6 characters long and contain at least one number.',

          // login:
          //--------------- headline (appbar)

          'loginLogIn': 'Log In',
          'loginPasswordReset': 'Password reset',
          'loginCheckEmail': 'Check your email',

          //--------------- description

          'loginForgotPassword': 'Forgot password?',
          'loginEnterEmail':
              "Enter the email address that you used to register. We'll send you an email with a code for resetting the password.",
          'loginCodeToResetPassword':
              "You'll receive a code to verify here so you can reset your password.",
          'loginStrongPasswords':
              'Strong passwords include numbers, letters, and punctuation marks.',
          'loginSuccessPasswordChange':
              "You're all set. You’ve successfully changed your password.",
          'loginUserNotFound': 'No user found for that email.',
          'loginWrongPassword': 'Wrong password provided for that user.',

          //--------------- validation

          'loginValidationNewPassword': 'New password',
          'loginValidationRepeatNewButton': 'Repeat new password',
          'loginValidationPasswordMatch': 'The passwords entered do not match',

          // home:

          'homeUpcoming': 'Upcoming',
          'homeLessonNameSchedule': 'Schedule',
          'homeReservedSeat': 'Reserved Seat',

          // lessons:
          'lessonsLessons': 'Lessons',
          'lessonsPast': 'Past',
          'lessonsDescription': 'Description',
          'lessonsLessonSchedule': 'Lesson Schedule',
          'lessonsLocation': 'Location',
          'lessonsDate': 'Date',
          'lessonsAttachments': 'Attachments',
          'lessonsRating': 'Rate the lesson',
          'lessonsSelectedSeat': 'Selected Seat:',
          'lessonsSeatAvailable': 'Available',
          'lessonsSeatNotAvailable': 'Not Available',
          'lessonsSeatSelected': 'Selected',

          // calendar:
          'calendarCalendar': 'Calendar',
          'calendarJanuary': 'January',
          'calendarFebruary': 'February',
          'calendarMarch': 'March',
          'calendarApril': 'April',
          'calendarMay': 'May',
          'calendarJune': 'June',
          'calendarJuly': 'July',
          'calendarAugust': 'August',
          'calendarSeptember': 'September',
          'calendarOctober': 'October',
          'calendarNovember': 'November',
          'calendarDecember': 'December',

          // profile:
          'profileProfile': 'Profile',
          'profileInfo': 'Info',
          'profileEdit': 'Edit',
          'profileGoals': 'Your Goals',
          'profileNoGoals': "Click 'Edit' to add goals",
          'profileSettings': 'Settings',
          'profileNotifications': 'Notifications',
          'profileDarkMode': 'Dark Mode',
          'profileTermsCo': 'Terms & Conditions',
          'profileLogOut': 'Log Out',
          'profilePrivacyPolicy': 'Privacy Policy',
          'profileEditGoals': 'Edit Goals',
          'profileEditProfile': 'Edit Profile',

          'profilePrivacyPolicyText':
              'Floofs doggorino bork puggorino adorable doggo, bork ur givin me a spook stop it fren. Long bois bork pupperino stop it fren, pats fluffer. You are doin me a concern aqua doggo fluffer shoob he made many woofs adorable doggo, fluffer long doggo wow such tempt. ',
          'profileTermsText':
              'Floofs doggorino bork puggorino adorable doggo, bork ur givin me a spook stop it fren. Long bois bork pupperino stop it fren, pats fluffer. You are doin me a concern aqua doggo fluffer shoob he made many woofs adorable doggo, fluffer long doggo wow such tempt. Super chub puggo doggorino most angery pupper I have ever seen, very good spot. Shooberino wow such tempt h*ck much ruin diet, you are doing me the shock. Most angery pupper I have ever seen doggorino the neighborhood pupper dat tungg tho bork boofers shoober, h*ck dat tungg tho doggo most angery pupper I have ever seen you are doin me a concern. Yapper doggorino super chub lotsa pats bork, he made many woofs smol borking doggo with a long snoot for pats much ruin diet. Ruff bork you are doing me the shock pupperino porgo heckin angery woofer porgo, you are doing me the shock I am bekom fat thicc wow very biscit adorable doggo.',

          // notifications:
          'notificationsNotifications': 'Notifications',

          // buttons:
          'buttonAllow': 'Allow',
          'buttonCancel': 'Cancel',
          'buttonChooseFromGallery': 'Choose from gallery',
          'buttonContinue': 'Continue',
          'buttonCreate': 'Create',
          'buttonCreateAccount': 'Create an Account',
          'buttonDontAllow': "Don't Allow",
          'buttonLogIn': 'Log In',
          'buttonNext': 'Next',

          'buttonResendMail': 'Resend email',
          'buttonReserveSeat': 'Reserve Seat',
          'buttonResetPassword': 'Reset Password',

          'buttonStart': 'Start',
          'buttonSkipForNow': 'Skip for now',
          'buttonTakePhoto': 'Take photo',
          'buttonUseSMS': 'Use SMS instead',

          'buttonReserve': 'Reserve',
          'buttonChange': 'Change',

          'buttonSave': 'Save',

          // icons:
          //----------- home

          'iconHome': 'Home',
          'iconLessons': 'Lessons',
          'iconCalendar': 'Calendar',
          'iconProfile': 'Profile',
        },
        'de_DE': {
          'helloWorld': 'Hallo Welt!',
          'appName': 'Cinnamon app',
        },
      };
}
