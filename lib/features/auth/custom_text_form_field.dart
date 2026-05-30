import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.maxLines =1,
    this.validator,
    required this.hintText,
    required this.title,
    this.obscureText = true,
     this.suffixIcon,
  });

  final TextEditingController controller;
  final String title;
  final int? maxLines ;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText ;
  final Widget? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  
bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 16),
        ),
        SizedBox(height: 8),
        TextFormField(
          
          maxLines: widget.maxLines,
          validator: widget.validator,
          controller: widget.controller,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 16),
          obscureText: widget.obscureText && !isPasswordVisible, 
          decoration: InputDecoration(
            suffixIcon: widget.obscureText ?  IconButton(
                  icon:
                      isPasswordVisible
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ) : null,
            errorStyle: TextStyle(color: Colors.white),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
