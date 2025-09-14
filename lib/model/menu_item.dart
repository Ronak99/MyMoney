import 'package:flutter/cupertino.dart';

class MenuItem {
  final String value;
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isDestructive;

  MenuItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });
}
