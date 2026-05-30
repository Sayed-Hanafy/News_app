import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.maxLines,
    this.validator,
    required this.hintText,
    required this.title,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String title;
  final int? maxLines;
  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 16),
        ),
        SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          validator: validator,
          controller: controller,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 16),
          decoration: InputDecoration(
            suffix: suffixIcon,
            errorStyle: TextStyle(color: Colors.white),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
