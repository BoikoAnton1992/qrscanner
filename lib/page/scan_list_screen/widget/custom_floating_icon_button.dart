import 'package:flutter/material.dart';

class CustomFloatingIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final double height;
  final IconData icon;

  const CustomFloatingIconButton({
    Key? key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(210, 100, 100, 255),
            Color.fromARGB(210, 80, 80, 255),
            Color.fromARGB(210, 40, 40, 255),
            Color.fromARGB(210, 0, 0, 255),
          ],
        ),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.white,
        iconSize: height / 2,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
