import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/design_system/resources/icon_constants.dart';
import '../../../core/design_system/resources/image_constants.dart';
import '../../../core/design_system/styles/theme.dart';
import '../../../core/extensions/context_ext.dart';
import '../../shared/widgets/switch_language_widget.dart';
import '../onboarding_coordinator.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 40, top: 20),
                      child: ImageWidget(ImageConstants.logo),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: SwitchLanguageWidget(isShortInfo: true),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: ImageWidget(ImageConstants.welcomeImage),
              ),
              ElevatedButton(
                onPressed: _onTapLoginWithGoogle,
                child: SizedBox(
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 36,
                            height: 36,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: context.theme.backgroundColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: const ImageWidget(IconConstants.google),
                          ),
                        ),
                        Center(
                          child: Text(context.translate.lblLoginWithGoogle),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                    onPressed: _onTapLoginWithEmailOrPhone,
                    style: context.theme.elevatedButtonTheme.style?.copyWith(
                      backgroundColor: MaterialStateProperty.all(
                          context.theme.themeColor.backgroundCart),
                    ),
                    child: Text(
                      context.translate.lblSignUpWithEmailOrPhone,
                      style: context.themeText.bodyMedium
                          ?.copyWith(color: context.themeColor.textColor),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 26),
                child: Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(context.translate.lblOr),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(context.translate.lblAlreadyHaveAnAccount),
                    GestureDetector(
                      onTap: _onTapSignin,
                      child: Text(
                        context.translate.lblSignIn,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSignin() => OnboardingCoordinator.startSignInScreen(context);

  void _onTapLoginWithGoogle() {}

  void _onTapLoginWithEmailOrPhone() {}
}
