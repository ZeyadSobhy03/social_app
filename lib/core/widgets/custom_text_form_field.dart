import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.controller,
    this.obscureText = false,
  });

  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(



      style: Theme.of(context).textTheme.titleSmall,
      validator: validator,
      controller: controller,
      obscureText: obscureText,

      decoration: InputDecoration(hintText: hintText),
    );
  }
}
