import 'package:flutter/material.dart';
import 'package:haweyati/auth-pages/signin.dart';

class HaweyatiApp extends MaterialApp {
  HaweyatiApp(): super(
      debugShowCheckedModeBanner:false,
    theme: ThemeData(fontFamily: "Lato",
      primaryColor: Color(0xffff974d),
      accentColor: Color(0xffff974d),
    ),
    home: SignIn()
  );
}