import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:haweyati/src/routes.dart';
import 'package:haweyati/src/ui/pages/features_page.dart';

class HaweyatiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: "Lato",
        appBarTheme: AppBarTheme(
          color: Color(0xff313f53),
          brightness: Brightness.dark
        ),
        primaryColor: Color(0xff313f53),
        accentColor: Color(0xFFFF974D)
      ),
      child: CupertinoApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,

        initialRoute: "/features",
        routes: routes,
//        home: FeaturesPage(),
      )
    );
  }
}


//class HaweyatiApp extends EasyLocalization {
//  HaweyatiApp([List<Locale> locales = const ]): super(

//  );
//}

//class HaweyatiApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return EasyLocalization(
//      child: CupertinoApp(
//
//      ),
//    );
//  }
//}
//class HaweyatiApp extends Theme {
//  HaweyatiApp(): super(
//    data: ThemeData(
//        fontFamily: "Lato",
//        appBarTheme: AppBarTheme(
//            brightness: Brightness.dark
//        ),
//        accentColor: Color(0xFFFF974D)
//    ),
//    child: CupertinoApp(
//      localizationsDelegates: [
//        DefaultMaterialLocalizations.delegate,
//        DefaultCupertinoLocalizations.delegate
//      ],
//
//      home: FeaturesPage(),
//    )
//  );
//}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:haweyati/auth-pages/signin.dart';
//import 'package:haweyati/src/ui/pages/instructions_page.dart';
//
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:haweyati/auth-pages/signin.dart';
//import 'package:haweyati/pages/appHomePage.dart';
//import 'package:haweyati/src/ui/pages/instructions_page.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:easy_localization/easy_localization.dart';
//
//class HaweyatiApp extends Theme {
//  HaweyatiApp(): super(
//    data: ThemeData(
//      fontFamily: "Lato",
//        appBarTheme: AppBarTheme(
//            brightness: Brightness.dark
//        ),
//        accentColor: Color(0xFFFF974D)
//    ),
//    child: CupertinoApp(
//      localizationsDelegates: [
//        DefaultMaterialLocalizations.delegate,
//        DefaultCupertinoLocalizations.delegate
//      ],
//
//      theme: CupertinoThemeData(
//        primaryColor: ,
//      )
//    )
//  );
//}
//
//
//class HaweyatiaApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Theme(
//
//      child: CupertinoApp(
//      ),
//    );
////    return MaterialApp(
////        localizationsDelegates: context.localizationDelegates,
////        supportedLocales: context.supportedLocales,
////        locale: context.locale,
////        debugShowCheckedModeBanner:false,
////        theme: ThemeData(fontFamily: "Lato",
////          appBarTheme: AppBarTheme(
////            brightness: Brightness.dark,
////          ),
////          primaryColor: Color(0xffff974d),
////          accentColor: Color(0xffff974d),
////        ),
////        home: InstructionsPage()
////    );
//
//  }
//}
//
////class HaweyatiApp extends MaterialApp {
////  HaweyatiApp(): super(
////      debugShowCheckedModeBanner:false,
////    theme: ThemeData(fontFamily: "Lato",
////  appBarTheme: AppBarTheme(
////  brightness: Brightness.dark,
////  ),
////      primaryColor: Color(0xffff974d),
////      accentColor: Color(0xffff974d),
////    ),
////    home: InstructionsPage()
////  ) {
////    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
////      statusBarColor: Color(0xff313f53),
////    ));
////  }
////}