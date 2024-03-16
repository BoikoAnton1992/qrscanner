import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeGenerator extends StatelessWidget {
  final String data;
  final BarcodeType barcodeType;

  const BarcodeGenerator({
    Key? key,
    required this.data,
    required this.barcodeType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Barcode barcode;
    switch (barcodeType) {
      case BarcodeType.code39:
        barcode = Barcode.code39();
        break;
      case BarcodeType.code128:
        barcode = Barcode.code128();
        break;
      case BarcodeType.qrCode:
        barcode = Barcode.qrCode();
        break;
      default:
        throw Exception("Unsupported barcode type");
    }

    return BarcodeWidget(
      barcode: barcode,
      data: data,
      height: 120,
      width: 200,
      drawText: false,
    );
  }
}

enum BarcodeType {
  code39,
  code128,
  qrCode,
}
