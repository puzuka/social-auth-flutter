import 'package:flutter/material.dart';
import 'package:social_auth_flutter/application.dart';

class AppDelegate {
  Future<void> run(Map<String, dynamic> env) async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const Application());
  }
}
