import 'package:flutter/material.dart';
import 'package:waspha/core/localization/generated/l10n.dart';

class LocalizationHelper {
  static Locale get defaultLocale =>
      AppLocalization.delegate.supportedLocales[0];

  static List<Locale> supportedLocales =
      AppLocalization.delegate.supportedLocales;

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalization.delegate;
}
