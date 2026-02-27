import 'package:flutter/material.dart';
import 'package:tech_blog/res/colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      thickness: 1.5,
      endIndent: size.width / 6,
    );
  }
}
