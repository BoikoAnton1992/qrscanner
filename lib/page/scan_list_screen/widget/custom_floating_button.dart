import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final double height;
  final IconData icon;

  const CustomFloatingActionButton({
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
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onPressed,
        child: const Icon(
          Icons.add,
          size: 55,
          color: Colors.white,
        ),
      ),
    );
  }
}
