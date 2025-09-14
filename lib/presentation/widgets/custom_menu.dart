import 'package:flutter/material.dart';

class CustomMenu extends StatelessWidget {
  const CustomMenu._({super.key});

  factory CustomMenu.account() {
    return const CustomMenu._();
  }

  // Future<T?> show<T>({required BuildContext context, required Position offset}) => showMenu(context: context, position: RelativeRect.fromLTRB(
  //   offset.dx,
  //   offset.dy,
  //   MediaQuery.of(context).size.width - offset.dx,
  //   MediaQuery.of(context).size.height - offset.dy,
  // ), items: [
  //   PopupMenuItem(
  //     child: Text("0"),
  //   ),
  //
  //   PopupMenuItem(
  //     child: Text("1"),
  //   ),
  //
  //   PopupMenuItem(
  //     child: Text("2"),
  //   ),
  //
  // ]);


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
