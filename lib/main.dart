import 'package:flutter/material.dart';
import 'package:presensi/riwayat_presensi.dart';
import 'package:presensi/splashscreen.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Presensi',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',                        // splash jadi route pertama
      routes: {
        '/':        (_) => const SplashScreen(),
        '/login':   (_) => const LoginPage(),
        '/riwayat': (_) => const RiwayatPresensiPage(),
      },
    );
  }
}
