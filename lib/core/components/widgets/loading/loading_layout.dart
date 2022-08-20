import 'package:flutter/material.dart';

import 'loading_widget.dart';

class LoadingLayout extends StatelessWidget {
  const LoadingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black45,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(child: LoadingWidget()),
    );
  }
}
