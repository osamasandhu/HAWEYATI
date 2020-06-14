import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haweyati/auth-pages/signin.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/src/ui/pages/instructions_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';


class HaweyatiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        debugShowCheckedModeBanner:false,
        theme: ThemeData(fontFamily: "Lato",
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
          ),
          primaryColor: Color(0xffff974d),
          accentColor: Color(0xffff974d),
        ),
        home: AppHomePage()
    );
  }
}

