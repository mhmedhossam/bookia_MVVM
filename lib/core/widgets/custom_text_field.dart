import 'package:bookia/core/utils/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool readOnly;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,

      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hint: Text(
          hintText,
          style: TextStyles.textStyle15.copyWith(color: AppColors.greyColor),
        ),
      ),
    );
  }
}
