import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:haweyati/src/app.dart';

void main() => runApp(EasyLocalization(
  supportedLocales: [const Locale('ar'), const Locale('en')],
  fallbackLocale: const Locale('en'),
  path: 'assets/translations',

  child: HaweyatiApp()
));
