import 'l10n.dart';

/// The translations for Vietnamese (`vi`).
class SVi extends S {
  SVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Xin Chào';

  @override
  String get lblLoginWithGoogle => 'Đăng nhập với Google';

  @override
  String get lblSignUpWithEmailOrPhone =>
      'Đăng ký với email hoặc số điện thoại';

  @override
  String get lblAlreadyHaveAnAccount => 'Bạn đã có sẵn tài khoản? ';

  @override
  String get lblSignOut => 'Đăng xuất';

  @override
  String get lblSignIn => 'Đăng nhập';

  @override
  String get lblSignUp => 'Đăng ký';

  @override
  String get lblOr => 'Hoặc';

  @override
  String get lblOrLoginWith => 'Hoặc login với';

  @override
  String get lblDontHaveAnAccount => 'Bạn chưa có tài khoản? ';

  @override
  String get lblLoginInToMake => 'Log in to make your memories.';

  @override
  String get lblForgetPassword => 'Quên mật khẩu?';

  @override
  String get lblUsernameHint => 'Tên đăng nhập, email hoặc số điện thoại';

  @override
  String get lblPassowrdHint => 'Mật khẩu';

  @override
  String get lblLogin => 'Đăng nhập';

  @override
  String lblHello(String name) {
    return 'Xin chào $name!';
  }

  @override
  String get lblTitleAppBarHome => 'Trang Chủ';

  @override
  String get lblDarkMode => 'Chế Độ Tối';

  @override
  String get lblLightMode => 'Chế Độ Sáng';

  @override
  String get lblTitleVI => 'Tiếng Việt';

  @override
  String get lblTitleEN => 'Tiếng Anh';

  @override
  String get lblLocalVI => 'vi';

  @override
  String get lblLocalEN => 'en';
}
