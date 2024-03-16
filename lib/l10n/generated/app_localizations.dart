import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uk')
  ];

  /// No description provided for @generateScreenShowSuccessText.
  ///
  /// In en, this message translates to:
  /// **'Screenshot saved to gallery'**
  String get generateScreenShowSuccessText;

  /// No description provided for @generateScreenShowErrorText.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get generateScreenShowErrorText;

  /// No description provided for @generateScreenAlertDialogTextbuttonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get generateScreenAlertDialogTextbuttonSave;

  /// No description provided for @generateScreenAlertDialogTextbuttonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get generateScreenAlertDialogTextbuttonClose;

  /// No description provided for @generateScreenAlertDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Change QRname'**
  String get generateScreenAlertDialogTitle;

  /// No description provided for @generateScreenTitleGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get generateScreenTitleGenerate;

  /// No description provided for @generateScreenButtonShareQR.
  ///
  /// In en, this message translates to:
  /// **'Share QR'**
  String get generateScreenButtonShareQR;

  /// No description provided for @generateScreenButtonSaveQR.
  ///
  /// In en, this message translates to:
  /// **'Save QR'**
  String get generateScreenButtonSaveQR;

  /// No description provided for @generateScreenTextFielHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter the Data/Link'**
  String get generateScreenTextFielHintText;

  /// No description provided for @generateScreenButtonGenerateQRCode.
  ///
  /// In en, this message translates to:
  /// **'GENERATE QR CODE'**
  String get generateScreenButtonGenerateQRCode;

  /// No description provided for @homeScreenTitleqrScanShare.
  ///
  /// In en, this message translates to:
  /// **'QR Scan Share'**
  String get homeScreenTitleqrScanShare;

  /// No description provided for @homeScreenButtonScanCode.
  ///
  /// In en, this message translates to:
  /// **'Scan CODE'**
  String get homeScreenButtonScanCode;

  /// No description provided for @homeScreenButtonScanListOfCode.
  ///
  /// In en, this message translates to:
  /// **'Scan list of code'**
  String get homeScreenButtonScanListOfCode;

  /// No description provided for @homeScreenButtonGenerateQR.
  ///
  /// In en, this message translates to:
  /// **'Generate QR'**
  String get homeScreenButtonGenerateQR;

  /// No description provided for @scanListScreenDialogDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get scanListScreenDialogDeleteTitle;

  /// No description provided for @scanListScreenDialogDeleteButtonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get scanListScreenDialogDeleteButtonClose;

  /// No description provided for @scanListScreenDialogDeleteButtonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get scanListScreenDialogDeleteButtonDelete;

  /// No description provided for @scanListScreenDialogDeleteButtonYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get scanListScreenDialogDeleteButtonYes;

  /// No description provided for @scanListScreenDialogDeleteAllTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear the entire list?'**
  String get scanListScreenDialogDeleteAllTitle;

  /// No description provided for @scanListScreenCenterText.
  ///
  /// In en, this message translates to:
  /// **'Not yet Scaned'**
  String get scanListScreenCenterText;

  /// No description provided for @scanListScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan list'**
  String get scanListScreenTitle;

  /// No description provided for @scanListScreenSnackBarBehaviorCopyfirstText.
  ///
  /// In en, this message translates to:
  /// **'List is empty'**
  String get scanListScreenSnackBarBehaviorCopyfirstText;

  /// No description provided for @scanListScreenSnackBarBehaviorCopySecondText.
  ///
  /// In en, this message translates to:
  /// **'Copied all result to clipboard'**
  String get scanListScreenSnackBarBehaviorCopySecondText;

  /// No description provided for @scanListSreenSnackBarBehaviorSendSecondText.
  ///
  /// In en, this message translates to:
  /// **'List is empty'**
  String get scanListSreenSnackBarBehaviorSendSecondText;

  /// No description provided for @scanListScreenBootonCopyScanResaultOnLongPress.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get scanListScreenBootonCopyScanResaultOnLongPress;

  /// No description provided for @scanScreenCenterText.
  ///
  /// In en, this message translates to:
  /// **'Not yet Scaned'**
  String get scanScreenCenterText;

  /// No description provided for @scanScreenTitleText.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scanScreenTitleText;

  /// No description provided for @scanScreenTextResult.
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get scanScreenTextResult;

  /// No description provided for @scanScreenTextButton.
  ///
  /// In en, this message translates to:
  /// **'Not yet Scanned'**
  String get scanScreenTextButton;

  /// No description provided for @scanScreenMainButtonWidgetOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get scanScreenMainButtonWidgetOpen;

  /// No description provided for @scanScreenMainButtonWidgetShareScanResult.
  ///
  /// In en, this message translates to:
  /// **'Share scan result'**
  String get scanScreenMainButtonWidgetShareScanResult;

  /// No description provided for @scanScreenMainButtonWidgetScanCode.
  ///
  /// In en, this message translates to:
  /// **'SCAN CODE'**
  String get scanScreenMainButtonWidgetScanCode;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'uk': return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
