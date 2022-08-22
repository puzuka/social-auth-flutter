
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_vi.dart';

/// Callers can lookup localized strings with an instance of S returned
/// by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'generated/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World! - EN'**
  String get helloWorld;

  /// No description provided for @lblLoginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get lblLoginWithGoogle;

  /// No description provided for @lblSignUpWithEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Sign up with email or phone number'**
  String get lblSignUpWithEmailOrPhone;

  /// No description provided for @lblAlreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get lblAlreadyHaveAnAccount;

  /// No description provided for @lblSignIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get lblSignIn;

  /// No description provided for @lblSignUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get lblSignUp;

  /// No description provided for @lblOr.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get lblOr;

  /// No description provided for @lblOrLoginWith.
  ///
  /// In en, this message translates to:
  /// **'Or login with'**
  String get lblOrLoginWith;

  /// No description provided for @lblDontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get lblDontHaveAnAccount;

  /// No description provided for @lblLoginInToMake.
  ///
  /// In en, this message translates to:
  /// **'Log in to make your memories.'**
  String get lblLoginInToMake;

  /// No description provided for @lblForgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forget password?'**
  String get lblForgetPassword;

  /// No description provided for @lblUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Username, email or phone number'**
  String get lblUsernameHint;

  /// No description provided for @lblPassowrdHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get lblPassowrdHint;

  /// No description provided for @lblLogin.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get lblLogin;

  /// The number of posts found
  ///
  /// In en, this message translates to:
  /// **'Hello {name}!'**
  String lblHello(String name);

  /// No description provided for @lblTitleAppBarHome.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get lblTitleAppBarHome;

  /// No description provided for @lblDarkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get lblDarkMode;

  /// No description provided for @lblLightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lblLightMode;

  /// No description provided for @lblTitleVI.
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get lblTitleVI;

  /// No description provided for @lblTitleEN.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get lblTitleEN;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SEn();
    case 'vi': return SVi();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
