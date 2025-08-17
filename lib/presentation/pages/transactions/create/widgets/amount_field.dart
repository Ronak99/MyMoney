import 'package:flutter/material.dart';

typedef OnChange = Function(String);

class CustomTextField extends StatelessWidget {
  final OnChange onChange;
  final String hint;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.onChange,
    required this.hint,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: keyboardType,
    );
  }
}
