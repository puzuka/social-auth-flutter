import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/context_ext.dart';
import '../../domain/entities/user.dart';
import '../onboarding/onboarding_coordinator.dart';
import '../shared/widgets/switch_language_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  final User userInfo;

  const HomeScreen({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onTapLogout() => OnboardingCoordinator.startWelcomeScreen(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.lblTitleAppBarHome),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(context.translate.lblHello(widget.userInfo.name)),
          ),
          Row(
            children: [
              Text(context.translate.lblLightMode),
              Switch(
                value: Theme.of(context).brightness == Brightness.dark,
                onChanged: (bool newValue) {
                  if (Theme.of(context).brightness == Brightness.dark) {
                    AdaptiveTheme.of(context).setLight();
                  } else {
                    AdaptiveTheme.of(context).setDark();
                  }
                },
              ),
              Text(context.translate.lblDarkMode),
            ]
                .map((e) => Expanded(
                        child: Align(
                      alignment: Alignment.center,
                      child: e,
                    )))
                .toList(),
          ),
          const SwitchLanguageWidget(),
        ],
      ),
      floatingActionButton: Material(
        color: context.themeColor.accent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          onTap: _onTapLogout,
          borderRadius: BorderRadius.circular(40),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Center(
                child: Text(
              'Logout',
              style: TextStyle(color: context.themeColor.primary),
            )),
          ),
        ),
      ),
    );
  }
}
