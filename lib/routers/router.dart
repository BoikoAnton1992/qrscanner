import '../page/generate_screen/generate.dart';
import '../page/scan_list_screen/scan_list.dart';
import '../qr_scan_share.dart';
import '../page/scan_screen/scan.dart';

final routes = {
  "/": (context) => const QRScanShare(),
  "/scan": (context) => const Scan(),
  "/generate": (context) => const Generate(),
  "/scanlistcode": (context) => const ScanListOfcode(),
};
