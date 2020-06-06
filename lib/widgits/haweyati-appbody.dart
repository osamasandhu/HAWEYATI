import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/widgits/stackButton.dart';

class HaweyatiAppBody extends StatefulWidget {

String title;
String detail;
Widget child;
String btnName;
Function onTap;
bool showButton;

HaweyatiAppBody({this.btnName,this.onTap, this.detail,this.title,this.child,this.showButton=false});

  @override
  _HaweyatiAppBodyState createState() => _HaweyatiAppBodyState();
}

class _HaweyatiAppBodyState extends State<HaweyatiAppBody> {



  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [


        Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
 textAlign: TextAlign.center,           ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
              child: Text(
                widget.detail,
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,             ),
            ),
            Expanded(child: widget.child,)
          ],
        ),        widget.showButton? StackButton(buttonName:widget.btnName,onTap: widget.onTap,):Container()

      ],
    );
  }
}
