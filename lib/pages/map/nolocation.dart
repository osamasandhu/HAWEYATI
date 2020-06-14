import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/stackButton.dart';

import '../locations-map_page.dart';

class NoLocation extends StatefulWidget {
  @override
  _NoLocationState createState() => _NoLocationState();
}

class _NoLocationState extends State<NoLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/pattern.png"))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Icon(
                    Icons.location_on,
                    size: 80,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      loremIpsum.substring(0,70),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          StackButton(
            onTap: () {
              CustomNavigator.navigateTo(context, MyLocationMapPage());
            },
            buttonName: "Set Your Location",
          )
        ],
      ),
    );
  }
}
