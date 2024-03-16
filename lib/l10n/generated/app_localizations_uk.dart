import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get generateScreenShowSuccessText => 'Знімок екрана збережено в галерею';

  @override
  String get generateScreenShowErrorText => 'Помилка';

  @override
  String get generateScreenAlertDialogTextbuttonSave => 'Зберегти';

  @override
  String get generateScreenAlertDialogTextbuttonClose => 'Закрити';

  @override
  String get generateScreenAlertDialogTitle => 'Змінити назву QR';

  @override
  String get generateScreenTitleGenerate => 'Генерувати QR';

  @override
  String get generateScreenButtonShareQR => 'Поділитись QR';

  @override
  String get generateScreenButtonSaveQR => 'Зберегти QR';

  @override
  String get generateScreenTextFielHintText => 'Введіть дані/посилання';

  @override
  String get generateScreenButtonGenerateQRCode => 'ЗГЕНЕРУВАТИ QR-КОД';

  @override
  String get homeScreenTitleqrScanShare => 'QR Scan Share';

  @override
  String get homeScreenButtonScanCode => 'Сканувати КОД';

  @override
  String get homeScreenButtonScanListOfCode => 'Cканувати список кодів';

  @override
  String get homeScreenButtonGenerateQR => 'Згенерувати QR';

  @override
  String get scanListScreenDialogDeleteTitle => 'Видалити';

  @override
  String get scanListScreenDialogDeleteButtonClose => 'Закрити';

  @override
  String get scanListScreenDialogDeleteButtonDelete => 'Видалено';

  @override
  String get scanListScreenDialogDeleteButtonYes => 'Так';

  @override
  String get scanListScreenDialogDeleteAllTitle => 'Очистити весь список?';

  @override
  String get scanListScreenCenterText => 'Ще не відскановано';

  @override
  String get scanListScreenTitle => 'Cканувати список';

  @override
  String get scanListScreenSnackBarBehaviorCopyfirstText => 'Список пустий';

  @override
  String get scanListScreenSnackBarBehaviorCopySecondText => 'Усі результати скопійовано в буфер обміну';

  @override
  String get scanListSreenSnackBarBehaviorSendSecondText => 'Список пустий';

  @override
  String get scanListScreenBootonCopyScanResaultOnLongPress => 'Скопійовано в буфер обміну';

  @override
  String get scanScreenCenterText => 'Ще не відскановано';

  @override
  String get scanScreenTitleText => 'Сканувати';

  @override
  String get scanScreenTextResult => 'Результат';

  @override
  String get scanScreenTextButton => 'Ще не відскановано';

  @override
  String get scanScreenMainButtonWidgetOpen => 'Відкрити';

  @override
  String get scanScreenMainButtonWidgetShareScanResult => 'Поділитись результатом сканування';

  @override
  String get scanScreenMainButtonWidgetScanCode => 'СКАНУВАТИ КОД';
}
