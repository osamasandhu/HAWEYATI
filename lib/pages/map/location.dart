import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haweyati/pages/map/setLocation.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/locationAppBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

import '../locations-map_page.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {


  void _showDialoag(){
    showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(

        title: Text("Use Location?",style: TextStyle(fontWeight: FontWeight.bold),),
        content:
        ListTile(leading: Icon(Icons.location_on,size: 30,color: Theme.of(context).accentColor,),title: Text("Use Wifi and mobile networks for location",style: TextStyle(fontSize: 14),),)

        ,actions: <Widget>[

        FlatButton(onPressed: (){              CustomNavigator.navigateTo(context, MyLocationMapPage());
}, child: Text("Yes",
          style: TextStyle(fontWeight: FontWeight.bold, color:Theme.of(context).accentColor),)),
        FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No",
          style: TextStyle(fontWeight: FontWeight.bold, color:Theme.of(context).accentColor),)),

        ],

      );
    });
  }

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
          StackButton(onTap:(){_showDialoag();} , buttonName: "Set You Location",)
        ],
      ),
    );
  }
}
