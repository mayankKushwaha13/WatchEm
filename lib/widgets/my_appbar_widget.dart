import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchem/utils/MyColors.dart';

class Banner extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();

    path.lineTo(0, h - 20);
    path.quadraticBezierTo(w / 4, h - 60, w / 2, h - 30);
    path.quadraticBezierTo(3 * w / 4, h, w, h - 100);
    path.lineTo(w, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyAppbarWidget extends StatelessWidget {
  const MyAppbarWidget({super.key, required this.title, this.fontsize = 25});
  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Banner(),
      child: Container(
        decoration: const BoxDecoration(
          color: MyColors.temptress,
        ),
        height: 140,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: fontsize,
              fontWeight: FontWeight.bold,
              color: MyColors.wheat,
            ),
          ),
        ),
      ),
    );
  }
}
