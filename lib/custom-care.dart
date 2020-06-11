import 'package:flutter/material.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/stackButton.dart';

class CustomCare extends StatefulWidget {
  @override
  _CustomCareState createState() => _CustomCareState();
}

class _CustomCareState extends State<CustomCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HaweyatiAppBar(),
        body: HaweyatiAppBody(
            title: "Need Help ?",
            detail:
                "Lorem ipsu m s bkj sab kj sab fk sb fklj sb fl jb s lk  jksanbflkbfklban k",
            child: Padding(padding: EdgeInsets.only(bottom: 100),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[


                Image.asset("assets/images/clock.png",height: 50,width: 50,)
,
SizedBox(height: 20,),
                Text("9:00 AM - 12:00 PM",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
               , SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[    Icon(Icons.fiber_manual_record,color: Colors.green,size: 15,),SizedBox(width: 6,),          Text("Avaliable for call",style: TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),)
],)            ],),
            ),onTap: (){},btnName: "Call Now",showButton: true,));
  }
}
