import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qrscan/Service/ad_mob_service.dart';
import 'package:qrscan/l10n_extension.dart';
import 'package:qrscan/widget/custom_app_bar.dart';
import 'package:qrscan/widget/main_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _banner;
  @override
  void initState() {
    super.initState();

    _createBannerAd();
  }

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMoberviceImage.bannerAdUnitId!,
      listener: AdMoberviceImage.bannerListener,
      request: const AdRequest(),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.text.homeScreenTitleqrScanShare,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'images/png/QRicon2.png',
                        scale: 2,
                      ),
                    ),
                  ),
                  MainButtonWidget(
                    text: context.text.homeScreenButtonScanCode,
                    onTap: () {
                      Navigator.of(context).pushNamed("/scan");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButtonWidget(
                    text: context.text.homeScreenButtonScanListOfCode,
                    onTap: (() {
                      Navigator.of(context).pushNamed("/scanlistcode");
                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButtonWidget(
                    text: context.text.homeScreenButtonGenerateQR,
                    onTap: () {
                      Navigator.of(context).pushNamed("/generate");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          _banner == null
              ? Container()
              : SizedBox(
                  height: 117,
                  child: AdWidget(ad: _banner!),
                )
        ],
      ),
    );
  }
}
