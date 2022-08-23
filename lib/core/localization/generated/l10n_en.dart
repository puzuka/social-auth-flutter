import 'l10n.dart';

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World! - EN';

  @override
  String get lblLoginWithGoogle => 'Login with Google';

  @override
  String get lblSignUpWithEmailOrPhone => 'Sign up with email or phone number';

  @override
  String get lblAlreadyHaveAnAccount => 'Already have an account? ';

  @override
  String get lblSignOut => 'Sign out';

  @override
  String get lblSignIn => 'Sign in';

  @override
  String get lblSignUp => 'Sign up';

  @override
  String get lblOr => 'Or';

  @override
  String get lblOrLoginWith => 'Or login with';

  @override
  String get lblDontHaveAnAccount => 'Don\'t have an account? ';

  @override
  String get lblLoginInToMake => 'Log in to make your memories.';

  @override
  String get lblForgetPassword => 'Forget password?';

  @override
  String get lblUsernameHint => 'Username, email or phone number';

  @override
  String get lblPassowrdHint => 'Password';

  @override
  String get lblLogin => 'Log In';

  @override
  String lblHello(String name) {
    return 'Hello $name!';
  }

  @override
  String get lblTitleAppBarHome => 'Home Page';

  @override
  String get lblDarkMode => 'Dark Mode';

  @override
  String get lblLightMode => 'Light Mode';

  @override
  String get lblTitleVI => 'Vietnamese';

  @override
  String get lblTitleEN => 'English';

  @override
  String get lblLocalVI => 'vi';

  @override
  String get lblLocalEN => 'en';
}
