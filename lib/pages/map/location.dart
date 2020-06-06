import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haweyati/pages/map/setLocation.dart';
import 'package:haweyati/widgits/locationAppBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LocationAppBar(),
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
                    "Location",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Lorem ipsum dolor sit amet, consectr adipiscing elit, do eiusm webdmstemporasio.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          StackButton(onTap:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SetLocation()));} , buttonName: "Set You Location",)
        ],
      ),
    );
  }
}
