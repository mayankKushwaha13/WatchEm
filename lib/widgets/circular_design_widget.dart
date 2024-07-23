import 'package:flutter/material.dart';
import 'package:watchem/utils/MyColors.dart';

class CircularDesignWidget extends StatelessWidget {
  const CircularDesignWidget(
      {super.key,
      required this.radius,
      required this.x,
      required this.y,
      this.z = 0,
      this.color = MyColors.geraldine,
      this.opacity = 0.3});
  final double radius, opacity, x, y, z;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      transform: Matrix4.translationValues(x, y, z),
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
