import 'package:flutter/material.dart';
import 'package:haweyati/src/app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';


void main() => runApp(
    EasyLocalization(
    supportedLocales: [Locale('ar'),Locale('en'),Locale('ur'),],
    path: 'assets/translations', // <-- change patch to your
    fallbackLocale: Locale('en'),
    child: HaweyatiApp()));

/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login(),
debugShowCheckedModeBanner: false,
    );
  }
}*/
