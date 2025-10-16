import 'package:flutter/material.dart';

typedef OnChange = Function(String);

class CustomTextField extends StatelessWidget {
  final OnChange onChange;
  final String hint;
  final TextInputType keyboardType;
  final int? maxLines;
  final String? initialValue;
  final bool autofocus;

  const CustomTextField({
    super.key,
    required this.onChange,
    required this.hint,
    this.maxLines,
    this.initialValue,
    this.autofocus = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hint,
      ),
      keyboardType: keyboardType,
      initialValue: initialValue,
      maxLines: maxLines,
    );
  }
}
