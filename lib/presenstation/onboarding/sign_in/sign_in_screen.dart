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
  final ValueNotifier<bool> _obscureText = ValueNotifier(true);
  final _ctrlTextFieldUsername =
      TextEditingController(text: 'PuzDev@gmail.com');
  final _ctrlTextFieldPassword = TextEditingController(text: '123456');

  void _onTapForgetPassword() {}

  void _onTapLogin() {
    context.read<SignInBloc>().add(SubmitSignInEvent(
        email: _ctrlTextFieldUsername.text,
        password: _ctrlTextFieldPassword.text));
  }

  void _onChangeOnscureText() {
    _obscureText.value = !_obscureText.value;
  }

  void _onListenerEventBloc(BuildContext context, SignInState state) {
    if (state is SingInSuccess) {
      AppMainCoordinator.startHomeApp(context, userInfo: state.user);
    } else if (state is SingInFailed) {
      showToastMessage(state.msg, ToastMessageType.error);
    }
  }

  @override
  void dispose() {
    _obscureText.dispose();
    super.dispose();
  }

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
                      Text(context.translate.lblLoginInToMake),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 12),
                        child: TextField(
                          controller: _ctrlTextFieldUsername,
                          decoration: InputDecoration(
                              hintText: context.translate.lblUsernameHint),
                        ),
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _obscureText,
                        builder: (_, obscureText, __) {
                          return TextField(
                            obscureText: obscureText,
                            controller: _ctrlTextFieldPassword,
                            autofillHints: const [AutofillHints.password],
                            decoration: InputDecoration(
                              hintText: context.translate.lblPassowrdHint,
                              suffixIcon: GestureDetector(
                                onTap: _onChangeOnscureText,
                                child: Icon(
                                  obscureText
                                      ? Icons.lock_outline
                                      : Icons.lock_open_sharp,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: _onTapForgetPassword,
                            child: Text(
                              context.translate.lblForgetPassword,
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(color: context.theme.primaryColor),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _onTapLogin,
                        child: Text(context.translate.lblLogin),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24, bottom: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(context.translate.lblDontHaveAnAccount),
                            Text(
                              context.translate.lblSignUp,
                              style: context.theme.textTheme.bodyMedium
                                  ?.copyWith(color: context.theme.primaryColor),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(context.translate.lblOrLoginWith),
                          ),
                          const Expanded(child: Divider()),
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
}
