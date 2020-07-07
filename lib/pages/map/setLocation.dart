//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:haweyati/widgits/locationAppBar.dart';
//import 'package:haweyati/widgits/stackButton.dart';
//import 'package:app_settings/app_settings.dart';
//
//class SetLocation extends StatefulWidget {
//  @override
//  _SetLocationState createState() => _SetLocationState();
//}
//
//class _SetLocationState extends State<SetLocation> {
//  void _showDialoag() {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text(
//              "Use Location?",
//              style: TextStyle(fontWeight: FontWeight.bold),
//            ),
//            content: ListTile(
//              leading: Icon(
//                Icons.location_on,
//                size: 30,
//                color: Theme.of(context).accentColor,
//              ),
//              title: Text(
//                "Use Wifi and mobile networks for location",
//                style: TextStyle(fontSize: 14),
//              ),
//            ),
//            actions: <Widget>[
//              FlatButton(
//                  onPressed: () {
//                    AppSettings.openLocationSettings();
//                  },
//                  child: Text(
//                    "Yes",
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        color: Theme.of(context).accentColor),
//                  )),
//              FlatButton(
//                  onPressed: (){AppSettings.openLocationSettings();},
//                  child: Container(
//                    decoration: BoxDecoration(
//                        color: Theme.of(context).accentColor,
//                        borderRadius: BorderRadius.circular(30)),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(
//                          vertical: 15, horizontal: 30),
//                      child: Text(
//                        "nkljsn",
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.bold),
//                      ),
//                    ),
//                  ))
//            ],
//          );
//        });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: LocationAppBar(),
//      body: Stack(
//        fit: StackFit.expand,
//        children: <Widget>[
//          StackButton(
//            onTap: () {
//              _showDialoag();
//            },
//            buttonName: "Confirm Location",
//          )
//        ],
//      ),
//    );
//  }
//}
