import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/widgits/appBar.dart';
class TermAndCondition extends StatefulWidget {
  @override
  _TermAndConditionState createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: HaweyatiAppBar(showHome: false,showCart: false, ),body: ListView(children: <Widget>[

      Text(
        "Term And Condition",
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

      SizedBox(height: 30,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 20,),




      SizedBox(height: 10,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 20,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 20,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 20,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 20,),
      text(),
      SizedBox(height: 5,),
      des(),
      SizedBox(height: 10,),

    ],padding: EdgeInsets.fromLTRB(15, 30,15, 10),),);
  }

  Widget text (){
    return Text("Tile",style: TextStyle(fontWeight: FontWeight.bold,fontSize:16 ),textAlign: TextAlign.center,);
  }
  Widget des(){
    return Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, an",textAlign: TextAlign.center,);
  }
}
