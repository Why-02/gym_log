import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;

  const StyledTextField({super.key, required this.controller, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}