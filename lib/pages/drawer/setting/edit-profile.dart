import 'package:flutter/material.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';
import 'package:haweyati/widgits/stackButton.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HaweyatiAppBar(showHome: false,showCart: false,),body: SingleChildScrollView(

      padding: EdgeInsets.all(20),
      child: Column(children: <Widget>[



      HaweyatiTextField(),
        SizedBox(height: 15,),
      HaweyatiTextField(),
        SizedBox(height: 15,),
      HaweyatiTextField(),
        SizedBox(height: 15,),
      HaweyatiTextField(),
        SizedBox(height: 15,),

        StackButton(buttonName: "Save",onTap: (){Navigator.of(context).pop();},)
    ],),),);
  }
}
