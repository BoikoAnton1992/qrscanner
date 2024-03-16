import 'package:flutter/material.dart';
import 'l10n/generated/app_localizations.dart';
import 'l10n/generated/app_localizations_en.dart';

class MyAppLocalizations {
  static AppLocalizations of(BuildContext context) {
    final l10n = Localizations.of<AppLocalizations>(context, AppLocalizations);
    return l10n ?? AppLocalizationsEn();
  }
}

extension Localization on BuildContext {
  AppLocalizations get text => MyAppLocalizations.of(this);
}
