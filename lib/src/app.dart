import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haweyati/auth-pages/signin.dart';
import 'package:haweyati/pages/startInstructions/instructions.dart';

class HaweyatiApp extends MaterialApp {
  HaweyatiApp(): super(
      debugShowCheckedModeBanner:false,
    theme: ThemeData(fontFamily: "Lato",
      primaryColor: Color(0xffff974d),
      accentColor: Color(0xffff974d),
    ),
    home: StartInstructions()
  ) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff313f53),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
  }
}