import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/src/app.dart';


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
