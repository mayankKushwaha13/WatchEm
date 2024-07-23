import 'package:flutter/material.dart';
import 'package:watchem/pages/splash_page.dart';
import 'package:watchem/utils/MyColors.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: ThemeData(scaffoldBackgroundColor: MyColors.asphalt),
    );
  }
}
