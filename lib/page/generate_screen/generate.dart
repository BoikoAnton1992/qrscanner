import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/Service/ad_mobe_service_video.dart';
import 'package:qrscan/l10n_extension.dart';
import 'package:qrscan/page/generate_screen/widget/qr_animated_container.dart';
import 'package:qrscan/widget/custom_app_bar.dart';
import 'package:qrscan/widget/main_button_widget.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class Generate extends StatefulWidget {
  const Generate({super.key});

  @override
  State<Generate> createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "https://bearer.pro";
  String qrTitle = "https://bearer.pro";
  RewardedAd? _rewardedAd;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // if you need to make a reward for viewing ads, use this
  int _rewardedScore = 0;
  final qrText = TextEditingController();
  final controller = ScreenshotController();

  Future<bool> saveImage(Uint8List? imageBytes) async {
    if (imageBytes == null) return false;
    await [Permission.storage].request();
    await Future.delayed(const Duration(milliseconds: 800));
    final name = "screenshot_$qrText";
    final result = await ImageGallerySaver.saveImage(imageBytes, name: name);
    return result['isSuccess'];
  }

  Future openDialogForChangeTitle() => showDialog(
      context: context,
      builder: (context) {
        final TextEditingController textController =
            TextEditingController(text: qrData);
        return AlertDialog(
          title: Text(context.text.generateScreenAlertDialogTitle),
          content: TextField(
            controller: textController,
          ),
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                      context.text.generateScreenAlertDialogTextbuttonClose)),
              TextButton(
                  onPressed: () async {
                    _updateQrTitle(textController.text);

                    final image = await controller.capture();
                    if (await saveImage(image)) {
                      showSuccess();
                    } else {
                      showError();
                    }
                    showMessage(textController.text);
                  },
                  child: Text(
                      context.text.generateScreenAlertDialogTextbuttonSave))
            ])
          ],
        );
      });

  void showMessage(String text) {
    Navigator.of(context).pop(
      text,
    );
  }

  @override
  void initState() {
    super.initState();
    _createRewardedAd();
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdMobServiceVideo.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
        onAdFailedToLoad: (error) => setState(() => _rewardedAd = null),
      ),
    );
  }

  void showSuccess() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 750),
        content: Text(
          context.text.generateScreenShowSuccessText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 750),
        content: Text(
          context.text.generateScreenShowErrorText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void _updateQrTitle(String newData) {
    setState(() {
      qrTitle = newData;
    });
  }

  void _showRewardedAd() {
    if (_rewardedAd != null && _rewardedScore % 3 == 0) {
      _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _createRewardedAd();
        },
      );
      _rewardedAd?.show(
        onUserEarnedReward: (ad, reward) => setState(() {
          _rewardedScore++;
        }),
      );
      _rewardedAd = null;
    } else {
      _rewardedScore++;
    }
  }

  Future<void> _shareQR(Uint8List image) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = await File('${tempDir.path}/qr.png').create();
    await tempFile.writeAsBytes(image);
    await Share.shareFiles([tempFile.path]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        title: context.text.generateScreenTitleGenerate,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            MainButtonWidget(
              text: context.text.generateScreenButtonShareQR,
              onTap: () async {
                final image = await controller.capture();
                try {
                  await _shareQR(image!);
                } catch (e) {
                  showError();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            MainButtonWidget(
                text: context.text.generateScreenButtonSaveQR,
                onTap: (() {
                  openDialogForChangeTitle();
                })),
            const Spacer(),
            // if you need to make a reward for viewing ads, use this
            // Text("Rewarded score is: $_rewardedScore"),
            Screenshot(
              controller: controller,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: KeyboardVisibilityBuilder(builder: (context, visible) {
                  return visible
                      ? QrAnimatedContainer(
                          qrData: qrData,
                          qrTitle: qrTitle,
                          width: 170.0,
                          duration: const Duration(milliseconds: 130),
                        )
                      : QrAnimatedContainer(
                          qrData: qrData,
                          qrTitle: qrTitle,
                          width: 270.0,
                          duration: const Duration(milliseconds: 130),
                        );
                }),
              ),
            ),

            TextField(
              controller: qrText,
              decoration: InputDecoration(
                  hintText: context.text.generateScreenTextFielHintText),
            ),
            const Spacer(),
            MainButtonWidget(
              text: context.text.generateScreenButtonGenerateQRCode,
              onTap: () {
                _showRewardedAd();
                if (qrText.text.isEmpty) {
                  setState(() {
                    qrData = "https://bearer.pro";
                  });
                } else {
                  setState(() {
                    qrData = qrText.text;
                    qrTitle = qrText.text;
                  });
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
