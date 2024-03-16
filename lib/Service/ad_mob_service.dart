import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMoberviceImage {
  static String? get bannerAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/6300978111"; // debug
      } else {
        return "ca-app-pub-1892276824012490/6145887129"; // prod
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/2934735716"; // debug
      } else {
        return "ca-app-pub-1892276824012490/5177536379"; // prod
      }
    }
    return null;
  }

  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    }
    return null;
  }

  static String? get rewardedAdUnitId {
    if (Platform.isAndroid) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/1033173712"; // debug
      } else {
        return "ca-app-pub-1892276824012490/9851545450"; // prod
      }
    } else if (Platform.isIOS) {
      if (kDebugMode) {
        return "ca-app-pub-3940256099942544/4411468910"; // debug
      } else {
        return "ca-app-pub-1892276824012490/9886937571"; // prod
      }
    }
    return null;
  }

  static final BannerAdListener bannerListener = BannerAdListener(
    onAdLoaded: (ad) => debugPrint("Ad loaded."),
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint("Adfailed to load: $error");
    },
    onAdOpened: (ad) => debugPrint("Ad opened"),
    onAdClosed: (ad) => debugPrint("Ad closed"),
  );
}
