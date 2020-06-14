import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

class ShareInvite extends StatefulWidget {
  @override
  _ShareInviteState createState() => _ShareInviteState();
}

class _ShareInviteState extends State<ShareInvite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Container(
                child: Center(
                    child: Image.asset(
                  "assets/images/gift.png",
                  width: 50,
                  height: 50,
                )),
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                height: 80,
                width: 80,
              )
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Share and Invite",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  loremIpsum.substring(0,50),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Container(width: 250, margin: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color:Color(0xfff2f2f2f2),borderRadius: BorderRadius.circular(15)), child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: <Widget>[Text("INOECUE",style: TextStyle(fontWeight: FontWeight.bold),),Text("Copy",style: TextStyle(color: Colors.orange),)],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
                ),),
              ),

            ],
          ),
          StackButton(
            onTap: null,
            buttonName: "Invite Friends",
          )
        ],
      ),
    );
  }
}
