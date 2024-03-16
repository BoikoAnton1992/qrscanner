import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrAnimatedContainer extends StatefulWidget {
  final String qrData;
  final String qrTitle;
  final double width;
  final Duration duration;

  const QrAnimatedContainer({
    Key? key,
    required this.qrData,
    required this.qrTitle,
    this.width = 170.0,
    this.duration = const Duration(milliseconds: 130),
  }) : super(key: key);

  @override
  QrAnimatedContainerState createState() => QrAnimatedContainerState();
}

class QrAnimatedContainerState extends State<QrAnimatedContainer> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      duration: widget.duration,
      width: visible ? widget.width : widget.width,
      child: Column(
        children: [
          QrImage(
            data: widget.qrData,
            version: QrVersions.auto,
            gapless: true,
            embeddedImageStyle: QrEmbeddedImageStyle(
              size: const Size(800, 800),
            ),
          ),
          Text(widget.qrTitle),
        ],
      ),
    );
  }
}
