import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watchem/utils/MyColors.dart';
import 'package:watchem/widgets/circular_design_widget.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            CircularDesignWidget(radius: 500, x: width / 2, y: -height / 2),
            CircularDesignWidget(
              radius: 360,
              x: width / 2,
              y: -height / 2,
              color: MyColors.asphalt,
              opacity: 1,
            ),
            CircularDesignWidget(radius: 300, x: -width / 2 - 15, y: height / 2 - 30),
            CircularDesignWidget(
              radius: 260,
              x: -width / 2,
              y: height / 2,
              color: MyColors.asphalt,
              opacity: 1,
            ),
            
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'lib/assets/logo.png',
                    color: MyColors.monarch,
                    height: 40,
                  ),
                  Image.asset(
                    'lib/assets/loading.gif',
                    color: MyColors.geraldine,
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void splash() async {
    Timer(const Duration(milliseconds: 3550), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }
}
