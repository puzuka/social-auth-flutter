import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UniversalPlatform.isAndroid
          ? const CircularProgressIndicator()
          : const CupertinoActivityIndicator(),
    );
  }
}
