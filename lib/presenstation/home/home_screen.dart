import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

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
      body: Center(child: Text('Hello ${widget.userInfo.name}')),
    );
  }
}
