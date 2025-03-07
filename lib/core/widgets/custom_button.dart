
import 'package:flutter/material.dart';

import '../theme/app_color.dart';
import '../theme/textstyle.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {super.key, required this.text, this.onPressed, this.height, this.width});
  final String text;
  final double? height;
  final double? width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 64,
      width: width ?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.bold16.copyWith(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
