import 'package:flutter/material.dart';
import 'package:social_media_project/home.dart';
import 'package:social_media_project/login.dart';
import 'package:social_media_project/register.dart';
import 'package:social_media_project/sharedPreference/shared_pref.dart';
import 'package:social_media_project/splash_screen.dart';
import 'package:social_media_project/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
