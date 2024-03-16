import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrscan/l10n_extension.dart';

class CopyableText extends StatelessWidget {
  final String text;

  const CopyableText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: text));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                context.text.scanListScreenBootonCopyScanResaultOnLongPress,
                textAlign: TextAlign.center,
              )),
        );
      },
      child: Text(text,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
    );
  }
}
