import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:waspha/core/localization/generated/l10n.dart';
import 'package:waspha/core/localization/localization_helper.dart';
import 'package:waspha/theme/index.dart';

import 'routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: ref.read(router),
          debugShowCheckedModeBanner: false,
          title: 'WASPHA',
          supportedLocales: LocalizationHelper.supportedLocales,

          theme: CustomTheme.lightTheme,
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FormBuilderLocalizations.delegate,
            PhoneFieldLocalization.delegate
          ],
          locale: const Locale('en'),
        );
      },
    );
  }
}
