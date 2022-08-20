import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InAppNotificationWidget extends StatelessWidget {
  final String text;
  final Color? colorBackground;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? colorIcon;

  const InAppNotificationWidget({
    Key? key,
    required this.text,
    this.textStyle,
    this.colorBackground,
    this.icon,
    this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorBackground ?? Theme.of(context).backgroundColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: icon ??
                  Icon(
                    CupertinoIcons.checkmark_circle,
                    color: colorIcon ?? Colors.black,
                  ),
            ),
            Expanded(
              child: Text(
                text,
                style: textStyle ?? Theme.of(context).textTheme.bodyText1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
