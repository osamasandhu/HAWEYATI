import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/locationAppBar.dart';
import 'package:haweyati/widgits/stackButton.dart';
import 'package:app_settings/app_settings.dart';

import '../locations-map_page.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  static List<String> languages = [
    'English',
    'Arabic',
  ];
  String selectedLanguage = languages[0];
  bool english = false;

  void _showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            title: Text(
              tr("Use_Location?"),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            content: Wrap(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  tr(
                    "locationUse?",
                  ),
                  style: TextStyle(fontSize: 12),
                ),
              ),
              SizedBox(
                height: 5,
                width: 10,
              ),
              FlatButton.icon(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                    size: 35,
                  ),
                  label: Expanded(
                      child: Text(
                    tr(
                      "Use Wifi and mobile network for location",
                    ),
                    style: TextStyle(fontSize: 12),
                  )
//                            Text(
//                            )
                      )),
Padding(
  padding: const EdgeInsets.only(top: 10),
  child:   Text(tr(              "Learn_More"),style: TextStyle(color: Theme.of(context).accentColor,fontSize: 12)),
)



            ]),
            actions: <Widget>[
              GestureDetector(
                  //splashColor: Theme.of(context).accentColor,
                  onTap: () {
                    //              AppSettings.openLocationSettings();

                    Navigator.of(context).pop();
                  },
                  child: Text(
                    tr("NO"),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor),
                  )),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                  //   splashColor: Theme.of(context).accentColor,
                  onTap: () {
                    AppSettings.openLocationSettings().whenComplete(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      (tr("YES")),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(
        context: context,
        showCart: false,
        showHome: false,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                    size: 100,
                  ),
                  SizedBox(height: 15),
                  Text(
                    tr("Location"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  Text(
                    tr("Location_Detail"),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          StackButton(
            onTap: () async {
              GeolocationStatus geolocationStatus =
                  await Geolocator().checkGeolocationPermissionStatus();
              print(geolocationStatus);
              if (await Geolocator().isLocationServiceEnabled()) {
                print("Enabled");
//                if (await Geolocator().checkGeolocationPermissionStatus() ==
//                    GeolocationStatus.granted) {
                  CustomNavigator.navigateTo(context, MyLocationMapPage());
//                } else {
//                    _showDialog();
//                  _/showAlert();
//                }
              } else {
                _showAlert();

                //      _showDialog();
                print("Location is turned off");
              }
            },
            buttonName: tr("Set_Your_Location"),
          )
        ],
      ),
    );
  }
}
