import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final bool isActive;

  const MainButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.blue,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: isActive
                ? const [
                    Color.fromARGB(210, 100, 100, 255),
                    Color.fromARGB(210, 80, 80, 255),
                    Color.fromARGB(210, 40, 40, 255),
                    Color.fromARGB(210, 0, 0, 255),
                  ]
                : [
                    Colors.grey.shade300,
                    Colors.grey.shade400,
                    Colors.grey.shade500,
                    Colors.grey.shade600,
                  ],
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
