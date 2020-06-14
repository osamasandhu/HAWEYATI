import 'package:flutter/material.dart';
import 'package:haweyati/widgits/appBar.dart';


class HaweyatiSetting extends StatefulWidget {
  @override
  _HaweyatiSettingState createState() => _HaweyatiSettingState();
}

class _HaweyatiSettingState extends State<HaweyatiSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: ListView(
        children: <Widget>[

          Text(
            "Settings",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            " Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy tex ",
            textAlign: TextAlign.center,
          ),

SizedBox(height: 25,),
          Container(margin: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color:Color(0xfff2f2f2f2),borderRadius: BorderRadius.circular(15)), child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[Text("Profile"),Icon(Icons.arrow_forward_ios,size: 15,)],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
          ),),
          Container(margin: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color:Color(0xfff2f2f2f2),borderRadius: BorderRadius.circular(15)), child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[Text("Notification"),Icon(Icons.arrow_forward_ios,size: 15,)],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
          ),),
          Container(margin: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color:Color(0xfff2f2f2f2),borderRadius: BorderRadius.circular(15)), child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(children: <Widget>[Text("Change Password"),Icon(Icons.arrow_forward_ios,size: 15,)],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
          ),),
        ],
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      ),
    );
  }
}
