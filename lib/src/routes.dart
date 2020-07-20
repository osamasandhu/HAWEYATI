import 'package:haweyati/notification.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'file:///C:/Users/Osama/Workspace/Projects/haweyati/lib/src/ui/pages/services/dumpsters/list_page.dart';
import 'package:haweyati/pages/helpline_page.dart';
import 'package:haweyati/pages/locations-map_page.dart';
//import 'package:haweyati/pages/scaffolding/scaffoldings/list_page.dart';
import 'package:haweyati/services/dumpsters_service.dart';
import 'package:haweyati/src/ui/pages/features_page.dart';
import 'package:haweyati/src/ui/pages/home_page.dart';
import 'package:haweyati/src/ui/pages/services/scaffoldings/computed/ceiling-caculation_page.dart';
import 'package:haweyati/src/ui/pages/services/scaffoldings/computed/facades-calculation_page.dart';
import 'package:haweyati/src/ui/pages/services/scaffoldings/list_page.dart';
import 'package:haweyati/src/ui/pages/services/scaffoldings/patented-options_page.dart';
import 'package:haweyati/src/ui/pages/services/scaffoldings/steel-options_page.dart';
//import 'package:haweyati/src/ui/pages/services/scaffoldings/computed/ceiling-caculation_page.dart';
//import 'package:haweyati/src/ui/pages/services/scaffoldings/computed/facades-calculation_page.dart';
//import 'package:haweyati/src/ui/pages/services/scaffoldings/list_page.dart';
//import 'package:haweyati/src/ui/pages/services/scaffoldings/patented-options_page.dart';
//import 'package:haweyati/src/ui/pages/services/scaffoldings/steel-options_page.dart';

import '../models/temp-model.dart';
import '../pages/building-material/building-material-List.dart';
import '../pages/finishing-material/finishing-material-List.dart';
import '../pages/scaffolding/scaffoldingList.dart';
import '../pages/vehicles-map_page.dart';
import 'ui/pages/location/pre-location_page.dart';
//import 'ui/pages/services/dumpsters/list_page.dart';

final routes = {
  "/": (context) => AppHomePage(),
  "/features": (context) => FeaturesPage(),
  "/helpline": (context) => HelplinePage(),
  "/location": (context) => MyLocationMapPage(),
  "/pre-location": (context) => PreLocationPage(),
//  "/notifications": (context) => NotificationsPage(),

  /// Construction Dumpsters.
  "/vehicles-list": (context) => VehiclesMapPage(),
  "/dumpsters-list": (context) => DumpstersListPage(),
  "/building-materials-list": (context) => BuildingMaterailListPage(),
  "/finishing-materials-list": (context) => FinishMaterailListPage(),

  /// Scaffolding
  "/scaffoldings-list": (context) => ScaffoldingsListPage(),
//  "/scaffolding-details": (context) => ScaffoldingDe,
  "/scaffoldings-facades": (context) => FacadesCalculationPage(),
  "/scaffoldings-ceiling": (context) => CeilingCalculationPage(),
  "/steel-scaffolding-options": (context) => SteelOptionsPage(),
  "/patented-scaffolding-options": (context) => PatentedOptionsPage(),
};