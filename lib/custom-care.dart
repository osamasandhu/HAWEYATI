import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/stackButton.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCare extends StatefulWidget {
  @override
  _CustomCareState createState() => _CustomCareState();
}

class _CustomCareState extends State<CustomCare> {


  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HaweyatiAppBar(context: context,),
        body: HaweyatiAppBody(
            title: "Need Help ?",
            detail:
                loremIpsum.substring(0,70),
            child: Padding(padding: EdgeInsets.only(bottom: 100),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[


                Image.asset("assets/images/clock.png",height: 50,width: 50,)
,
SizedBox(height: 20,),
                Text("9:00 AM - 12:00 PM",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
               , SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[    Icon(Icons.fiber_manual_record,color: Colors.green,size: 15,),SizedBox(width: 6,),          Text("Avaliable for call",style: TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),)
],)            ],),
            ),onTap: (){launch("tel://03472363720");},btnName: "Call Now",showButton: true,));
  }
}
