import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get generateScreenShowSuccessText => 'Скриншот сохранен в галерее';

  @override
  String get generateScreenShowErrorText => 'Ошибка';

  @override
  String get generateScreenAlertDialogTextbuttonSave => 'Сохранить';

  @override
  String get generateScreenAlertDialogTextbuttonClose => 'Закрыть';

  @override
  String get generateScreenAlertDialogTitle => 'Изменить QR-имя';

  @override
  String get generateScreenTitleGenerate => 'Создать QR';

  @override
  String get generateScreenButtonShareQR => 'Поделиться QR-кодом';

  @override
  String get generateScreenButtonSaveQR => 'Сохранить QR-код';

  @override
  String get generateScreenTextFielHintText => 'Введите данные/ссылку';

  @override
  String get generateScreenButtonGenerateQRCode => 'СОЗДАТЬ QR-КОД';

  @override
  String get homeScreenTitleqrScanShare => 'QR Scan Share';

  @override
  String get homeScreenButtonScanCode => 'Сканировать КОД';

  @override
  String get homeScreenButtonScanListOfCode => 'Cканировать список кодов';

  @override
  String get homeScreenButtonGenerateQR => 'Создать QR-код';

  @override
  String get scanListScreenDialogDeleteTitle => 'Удалить';

  @override
  String get scanListScreenDialogDeleteButtonClose => 'Закрыть';

  @override
  String get scanListScreenDialogDeleteButtonDelete => 'Удалено';

  @override
  String get scanListScreenDialogDeleteButtonYes => 'Да';

  @override
  String get scanListScreenDialogDeleteAllTitle => 'Очистить весь список?';

  @override
  String get scanListScreenCenterText => 'Еще не отсканировано';

  @override
  String get scanListScreenTitle => 'Cканировать список';

  @override
  String get scanListScreenSnackBarBehaviorCopyfirstText => 'Список пуст';

  @override
  String get scanListScreenSnackBarBehaviorCopySecondText => 'Весь результат скопирован в буфер обмена';

  @override
  String get scanListSreenSnackBarBehaviorSendSecondText => 'Список пуст';

  @override
  String get scanListScreenBootonCopyScanResaultOnLongPress => 'Скопировано в буфер обмена';

  @override
  String get scanScreenCenterText => 'Еще не отсканировано';

  @override
  String get scanScreenTitleText => 'Сканировать';

  @override
  String get scanScreenTextResult => 'Результат';

  @override
  String get scanScreenTextButton => 'Еще не отсканировано';

  @override
  String get scanScreenMainButtonWidgetOpen => 'Открыть';

  @override
  String get scanScreenMainButtonWidgetShareScanResult => 'Поделитесь результатом сканирования';

  @override
  String get scanScreenMainButtonWidgetScanCode => 'СКАНИРОВАТЬ КОД';
}
