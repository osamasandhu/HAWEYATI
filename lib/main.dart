import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:haweyati/src/app.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [const Locale('ar'), const Locale('en')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: HaweyatiApp((await SharedPreferences.getInstance()).getBool('firstTime') ?? true)
  ));
}
