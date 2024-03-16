import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget? action;

  const CustomAppBar({
    super.key,
    required this.title,
    this.action,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [action ?? const SizedBox.shrink()],
      backgroundColor: Colors.transparent,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      title: Text(
        title,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(210, 100, 100, 255),
              Color.fromARGB(210, 80, 80, 255),
              Color.fromARGB(210, 40, 40, 255),
              Color.fromARGB(210, 0, 0, 255),
            ],
          ),
        ),
      ),
    );
  }
}
