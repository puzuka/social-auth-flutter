import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/extensions/context_ext.dart';
import '../../domain/entities/user.dart';
import '../shared/app_setting_bloc/app_setting_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  final User userInfo;

  const HomeScreen({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          _renderRowWithExpendItem(
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
            ],
          ),
          _renderRowWithExpendItem(
            children: [
              Text(context.translate.lblTitleVI),
              Switch(
                value: Localizations.localeOf(context).languageCode == 'en',
                onChanged: (bool newValue) {
                  if (Localizations.localeOf(context).languageCode == 'en') {
                    context.read<AppSettingBloc>().add(SaveLanguageEvent('vi'));
                  } else {
                    context.read<AppSettingBloc>().add(SaveLanguageEvent('en'));
                  }
                },
              ),
              Text(context.translate.lblTitleEN),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderRowWithExpendItem({
    required List<Widget> children,
    Alignment alignment = Alignment.center,
  }) {
    return Row(
      children: List.generate(
        children.length,
        (index) => Expanded(
          child: Align(
            alignment: alignment,
            child: children[index],
          ),
        ),
      ),
    );
  }
}
