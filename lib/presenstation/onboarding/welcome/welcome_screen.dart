import 'package:flutter/material.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/design_system/resources/icon_constants.dart';
import '../../../core/design_system/resources/image_constants.dart';
import '../../../core/design_system/styles/theme.dart';
import '../../../core/extensions/context_ext.dart';
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
              const Padding(
                padding: EdgeInsets.only(bottom: 40, top: 20),
                child: Center(child: ImageWidget(ImageConstants.logo)),
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
                        const Center(child: Text('Login with Google')),
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
                      'Sign up with email or phone number',
                      style: context.themeText.bodyMedium
                          ?.copyWith(color: context.themeColor.textColor),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 26),
                child: Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: _onTapSignin,
                      child: Text(
                        'Sign in',
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
