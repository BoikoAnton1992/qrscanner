import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qrscan/Service/ad_mob_service.dart';
import 'package:qrscan/l10n_extension.dart';
import 'package:qrscan/page/scan_screen/widget/copyable_text.dart';
import 'package:qrscan/widget/main_button_widget.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widget/custom_app_bar.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  launchurl() async {
    final String url = qrResult;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      _makePhoneCall(qrResult);
      throw "cannot launch $url]";
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: qrResult,
    );
    await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    );
  }

  BannerAd? _banner;
  @override
  void initState() {
    super.initState();

    _createBannerAd();
  }

  void _shareQR() {
    Share.share(qrResult);
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMoberviceImage.bannerAdUnitId!,
      listener: AdMoberviceImage.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  // "scanScreenCenterText": "Not yet Scaned",
  String qrResult = "Not yet Scanned";
  bool isScanDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.text.scanScreenTitleText,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      context.text.scanScreenTextResult,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: isScanDone
                          ? () {
                              launchurl();
                            }
                          : null,
                      child: CopyableText(
                        text: isScanDone
                            ? qrResult
                            : context.text.scanScreenTextButton,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButtonWidget(
                        text: context.text.scanScreenMainButtonWidgetOpen,
                        isActive: isScanDone,
                        onTap: isScanDone
                            ? () {
                                launchurl();
                              }
                            : null),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButtonWidget(
                        text: context
                            .text.scanScreenMainButtonWidgetShareScanResult,
                        isActive: isScanDone,
                        onTap: isScanDone
                            ? () {
                                _shareQR();
                              }
                            : null),
                    const SizedBox(
                      height: 20,
                    ),
                    MainButtonWidget(
                      text: context.text.scanScreenMainButtonWidgetScanCode,
                      onTap: () async {
                        ScanResult scaning = await BarcodeScanner.scan();
                        setState(() {
                          if (scaning.rawContent.isNotEmpty) {
                            qrResult = scaning.rawContent;
                            isScanDone = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: _banner == null
                  ? Container()
                  : SizedBox(
                      height: 117,
                      child: AdWidget(ad: _banner!),
                    ),
            )
          ]),
    );
  }
}
