import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';

class HaweyatiRewards extends StatefulWidget {
  @override
  _HaweyatiRewardsState createState() => _HaweyatiRewardsState();
}

class _HaweyatiRewardsState extends State<HaweyatiRewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: ListView(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
        children: <Widget>[
          Text(
            "Haweyati Rewards",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            loremIpsum.substring(0,50),
            textAlign: TextAlign.center,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff313f53)),
              margin: EdgeInsets.symmetric(vertical: 25),
              padding: EdgeInsets.all(23),
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("2,596",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "points",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Text("Earn Points",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      Text(
                        "Spend 2000 SR  and get 100 points",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Align(
                      alignment: Alignment(0.9, -0.6),
                      child: SizedBox(
                          width: 100,
                          height: 80,
                          child: Image.asset(
                            "assets/images/homepageimage.png",
                          ))),
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: _buildButton(onTap: (){}, buttonName: "History")),
                Expanded(
                    flex: 1,
                    child:
                        _buildButton(onTap: null, buttonName: "Your Vouchers"))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildText(text: "Finishing Material"),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),SizedBox(
            height: 20,
          ),
          _buildText(text: "Building Material"),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
                _buildHorizontalList(
                    text1: "Get Mapefill", text2: "1200 points"),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildText({String text}) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildHorizontalList({String text1, String text2}) {
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Image.asset('assets/images/Sand 1.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
            child: Text(text2),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start);
  }

  Widget _buildButton({Function onTap, String buttonName}) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.grey.shade300),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              buttonName,
            ),
          ),
        ),
      ),
    );
  }
}
