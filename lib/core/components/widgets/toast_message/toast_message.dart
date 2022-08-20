import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'widgets/in_app_notification.dart';

enum ToastMessageType {
  success,
  warning,
  error,
}

extension ShowToastExt on State<StatefulWidget> {
  void showToastMessage(String message,
      [ToastMessageType type = ToastMessageType.success]) {
    var colorBg = Theme.of(context).scaffoldBackgroundColor;
    var icon = const Icon(CupertinoIcons.checkmark_circle, color: Colors.black);

    switch (type) {
      case ToastMessageType.success:
        colorBg = const Color(0xFF28a745);
        icon = const Icon(CupertinoIcons.checkmark_circle, color: Colors.white);
        break;
      case ToastMessageType.warning:
        colorBg = Colors.amber[400]!;
        icon = const Icon(CupertinoIcons.info, color: Colors.white);
        break;
      case ToastMessageType.error:
        colorBg = const Color(0xffff5252);
        icon = const Icon(Icons.error, color: Colors.white);
        break;
    }

    showTopSnackBar(
      context,
      InAppNotificationWidget(
        text: message,
        colorBackground: colorBg,
        icon: icon,
        textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: Colors.white,
            ),
      ),
      displayDuration: const Duration(milliseconds: 1200),
    );
  }
}
