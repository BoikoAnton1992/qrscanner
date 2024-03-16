import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get generateScreenShowSuccessText => 'Screenshot saved to gallery';

  @override
  String get generateScreenShowErrorText => 'Error';

  @override
  String get generateScreenAlertDialogTextbuttonSave => 'Save';

  @override
  String get generateScreenAlertDialogTextbuttonClose => 'Close';

  @override
  String get generateScreenAlertDialogTitle => 'Change QRname';

  @override
  String get generateScreenTitleGenerate => 'Generate';

  @override
  String get generateScreenButtonShareQR => 'Share QR';

  @override
  String get generateScreenButtonSaveQR => 'Save QR';

  @override
  String get generateScreenTextFielHintText => 'Enter the Data/Link';

  @override
  String get generateScreenButtonGenerateQRCode => 'GENERATE QR CODE';

  @override
  String get homeScreenTitleqrScanShare => 'QR Scan Share';

  @override
  String get homeScreenButtonScanCode => 'Scan CODE';

  @override
  String get homeScreenButtonScanListOfCode => 'Scan list of code';

  @override
  String get homeScreenButtonGenerateQR => 'Generate QR';

  @override
  String get scanListScreenDialogDeleteTitle => 'Delete';

  @override
  String get scanListScreenDialogDeleteButtonClose => 'Close';

  @override
  String get scanListScreenDialogDeleteButtonDelete => 'Delete';

  @override
  String get scanListScreenDialogDeleteButtonYes => 'Yes';

  @override
  String get scanListScreenDialogDeleteAllTitle => 'Clear the entire list?';

  @override
  String get scanListScreenCenterText => 'Not yet Scaned';

  @override
  String get scanListScreenTitle => 'Scan list';

  @override
  String get scanListScreenSnackBarBehaviorCopyfirstText => 'List is empty';

  @override
  String get scanListScreenSnackBarBehaviorCopySecondText => 'Copied all result to clipboard';

  @override
  String get scanListSreenSnackBarBehaviorSendSecondText => 'List is empty';

  @override
  String get scanListScreenBootonCopyScanResaultOnLongPress => 'Copied to clipboard';

  @override
  String get scanScreenCenterText => 'Not yet Scaned';

  @override
  String get scanScreenTitleText => 'Scan';

  @override
  String get scanScreenTextResult => 'Result';

  @override
  String get scanScreenTextButton => 'Not yet Scanned';

  @override
  String get scanScreenMainButtonWidgetOpen => 'Open';

  @override
  String get scanScreenMainButtonWidgetShareScanResult => 'Share scan result';

  @override
  String get scanScreenMainButtonWidgetScanCode => 'SCAN CODE';
}
