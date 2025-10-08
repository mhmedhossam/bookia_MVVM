import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;
  final double height;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;

  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.height = 55,
    required this.bgColor,
    this.borderColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.textStyle15.copyWith(color: textColor),
      ),
    );
  }
}
