import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
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
                          "assets/images/ratestar.png",
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
                "Rate the app",
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
SizedBox(height: 15,),              Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                  Image.asset("assets/images/ratestar2.png",width: 30,height: 30,),SizedBox(width: 5,),
                  Image.asset("assets/images/ratestar2.png",width: 30,height: 30,),SizedBox(width: 5,),
                  Image.asset("assets/images/ratestar2.png",width: 30,height: 30,),SizedBox(width: 5,),
                  Image.asset("assets/images/ratestar2.png",width: 30,height: 30,),SizedBox(width: 5,),
                  Image.asset("assets/images/ratestar2.png",width: 30,height: 30,),SizedBox(width: 5,),
                ],)
              ),

            ],
          ),
          StackButton(
            onTap: null,
            buttonName: "Submit",
          )
        ],
      ),
    );
  }
}
