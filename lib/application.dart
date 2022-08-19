import 'package:flutter/material.dart';

import 'presenstation/routes.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
      initialRoute: 'example',
    );
  }
}
