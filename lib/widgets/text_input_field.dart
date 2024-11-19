import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLength,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final int? maxLength;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        counterText: maxLength != null ? '0/$maxLength' : null,
      ),
      maxLength: maxLength,
      keyboardType: keyboardType,
    );
  }
}