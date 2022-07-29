abstract class AppTranslation {
  static Map<String, Map<String, String>> translationsKeys = {
    "en_US": enUS,
    "hi": hi
  };

  static List<Map<String, String>> supportedLanguages = [
    {"English": "en_us"},
    {"Hindi": "hi"},
  ];
}

final Map<String, String> enUS = {
  'welcomeText': "Some Dummy Text",
  'login': 'LOGIN',
  'version': 'Version',
  'loginUsingMobileNumber': 'Login using mobile number',
  'enterMobileNumber': 'Enter Mobile Number',
  'or': 'OR',
  'loginWith': 'Login with',
  'autoVerifying': 'Auto Verifying One Time Password that we have sent to you:',
  'resend': 'Resend',
  'VERIFY': 'VERIFY',
  'uploadProfilePicture': 'Upload Profile Picture'
};
final Map<String, String> hi = {
  'welcomeText': "hor bhai kaisa hai",
  'login': 'LOGIN',
  'version': 'Version',
  'loginUsingMobileNumber': 'Login using mobile number',
  'enterMobileNumber': 'Enter Mobile Number',
  'or': 'OR',
  'loginWith': 'Login with',
  'autoVerifying': 'Auto Verifying One Time Password that we have sent to you:',
  'resend': 'Resend',
  'VERIFY': 'VERIFY',
  'uploadProfilePicture': 'Upload Profile Picture'
};
