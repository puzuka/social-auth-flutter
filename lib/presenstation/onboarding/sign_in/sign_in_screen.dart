import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/components/widgets/loading/loading_layout.dart';
import '../../../core/components/widgets/toast_message/toast_message.dart';
import '../../../core/design_system/resources/icon_constants.dart';
import '../../../core/design_system/resources/image_constants.dart';
import '../../../core/design_system/styles/theme.dart';
import '../../../core/extensions/context_ext.dart';
import '../../app_main_coordinator.dart';
import 'bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/sign-in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final ctrlTextFieldUsername = TextEditingController(text: 'PuzDev@gmail.com');
  final ctrlTextFieldPassword = TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<SignInBloc, SignInState>(
      listener: _onListenerEventBloc,
      builder: (_, state) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 28),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ImageWidget(
                          ImageConstants.logo,
                          width: size.width * 0.6,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text('Log in to make your memories.'),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 12),
                        child: TextField(
                          controller: ctrlTextFieldUsername,
                          decoration: const InputDecoration(
                              hintText: 'Username, email or phone number'),
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        controller: ctrlTextFieldPassword,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: _onTapForgetPassword,
                            child: Text(
                              'Forget password?',
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(color: context.theme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _onTapLogin,
                        child: const Text('Log In'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don’t have an account? '),
                            Text(
                              'Sign up',
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(color: context.theme.primaryColor),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text('Or login with'),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _renderButtonIcon(IconConstants.google),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: _renderButtonIcon(IconConstants.apple),
                            ),
                            _renderButtonIcon(IconConstants.facebook)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            if (state is SignInLoading) const LoadingLayout(),
          ],
        );
      },
    );
  }

  void _onTapForgetPassword() {}

  void _onTapLogin() {
    context.read<SignInBloc>().add(SubmitSignInEvent(
        email: ctrlTextFieldUsername.text,
        password: ctrlTextFieldPassword.text));
  }

  Widget _renderButtonIcon(String icon, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        height: 56,
        decoration: BoxDecoration(
          color: context.theme.themeColor.backgroundCart,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: context.theme.themeColor.borderCard,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: ImageWidget(
          icon,
          fit: BoxFit.contain,
          width: 30,
          height: 30,
        ),
      ),
    );
  }

  void _onListenerEventBloc(BuildContext context, SignInState state) {
    if (state is SingInSuccess) {
      AppMainCoordinator.startHomeApp(context, userInfo: state.user);
    } else if (state is SingInFailed) {
      showToastMessage(state.msg, ToastMessageType.error);
    }
  }
}
