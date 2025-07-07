import 'package:flutter/material.dart';
import 'package:presensi/profile.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: true,
        home: LoginPage(),
        routes: {
          '/login': (_) => const LoginPage(),
          '/profile': (_) => const ProfilePage(),
    });
  }
}
