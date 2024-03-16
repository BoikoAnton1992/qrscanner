import 'package:flutter/foundation.dart';

class AdMobServiceVideo {
  static String get rewardedAdUnitId {
    if (kDebugMode) {
      // Test ID
      return 'ca-app-pub-3940256099942544/5224354917';
    } else {
      // Your production ID
      return 'ca-app-pub-1892276824012490/9886937571';
    }
  }
}
