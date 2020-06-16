import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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

 void _showDialog(){

   showDialog(
       context: context,
       builder: (BuildContext context) {
         return Dialog(
           shape: RoundedRectangleBorder(
               borderRadius:
               BorderRadius.circular(20.0)), //this right here
           child: Container(height: 280,
             child: Padding(
               padding: const EdgeInsets.all(20.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                 Text(
                "Use Location?",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
              ),SizedBox(height: 15,),

                   Text("This device wants to change your device setting")

                 ,

SizedBox(height: 15,),
               ListTile(
                leading: Icon(
                  Icons.location_on,
                  size: 40,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  "Use Wi-fi and mobile networks for location",
                  style: TextStyle(fontSize: 14),
                ),
              ),


                   SizedBox(height: 15,),

                   Text("Learn More",style: TextStyle(color: Theme.of(context).accentColor),)

                   ,
                   Align(alignment: Alignment(1,0),child:

                   Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[




                   FlatButton(splashColor: Theme.of(context).accentColor,
                       onPressed: () {
                         CustomNavigator.navigateTo(context, MyLocationMapPage());
                       },
                       child: Text(
                         "Yes",
                         style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Theme.of(context).accentColor),
                       )),
               FlatButton(splashColor: Theme.of(context).accentColor,
                   onPressed: () {
                     //              AppSettings.openLocationSettings();
                     AppSettings.openLocationSettings().whenComplete(                CustomNavigator.navigateTo(context, MyLocationMapPage())
                     );

                   },
                   child: Text(
                     "No",
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         color: Theme.of(context).accentColor),
                   )),













             ],


                   )
                   )
                 ],
               ),
             ),
           ),
         );
       });

 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,showCart: false,showHome: false,),
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
          StackButton(
            onTap: () {
              _showDialog();
            },
            buttonName: "Set You Location",
          )
        ],
      ),
    );
  }
}
