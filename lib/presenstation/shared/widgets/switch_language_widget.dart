import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagewidget/imagewidget.dart';

import '../../../core/extensions/context_ext.dart';
import '../../../core/extensions/locale_ext.dart';
import '../../../core/localization/generated/l10n.dart';
import '../app_setting_bloc/app_setting_bloc.dart';

class SwitchLanguageWidget extends StatelessWidget {
  final bool isShortInfo;

  const SwitchLanguageWidget({
    Key? key,
    this.isShortInfo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trans = context.translate;
    final appSetting = context.read<AppSettingBloc>();
    if (isShortInfo) {
      return DropdownButton<String>(
        onChanged: (v) =>
            appSetting.add(SaveLanguageEvent(v ?? trans.lblLocalEN)),
        value: Localizations.localeOf(context).languageCode,
        items: List.generate(
          S.supportedLocales.length,
          (index) => DropdownMenuItem(
            value: S.supportedLocales[index].languageCode,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ImageWidget(
                    S.supportedLocales[index].flagAsset,
                    width: 20,
                  ),
                ),
                Text(S.supportedLocales[index].languageCode.toUpperCase()),
              ],
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(trans.lblTitleVI),
        SizedBox(
          width: 100,
          child: Switch(
            value: Localizations.localeOf(context).languageCode ==
                trans.lblLocalEN,
            onChanged: (bool newValue) {
              if (newValue) {
                appSetting.add(SaveLanguageEvent(trans.lblLocalEN));
              } else {
                appSetting.add(SaveLanguageEvent(trans.lblLocalVI));
              }
            },
          ),
        ),
        Text(trans.lblTitleEN),
      ]
          .map(
            (e) => Expanded(
              child: Align(
                alignment: Alignment.center,
                child: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
