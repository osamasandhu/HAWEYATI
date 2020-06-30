import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/pages/helpline_page.dart';
import 'package:haweyati/pages/locations-map_page.dart';
import 'package:haweyati/pages/map/location.dart';
import 'package:haweyati/src/ui/pages/features_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final routes = {
  "/": (context) => AppHomePage(),
  "/features": (context) => FeaturesPage(),
  "/helpline": (context) => HelplinePage(),
  "/pre-location": (context)=> Location(),
  "/select-location": (context)=> MyLocationMapPage()
};