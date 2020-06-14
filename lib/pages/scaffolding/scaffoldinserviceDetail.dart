import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/time-location.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingTimeLocation.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class ScaffoldingServicesDetail extends StatefulWidget {
  ConstructionService constructionService;
  ScaffoldingServicesDetail({this.constructionService});
  @override
  _ScaffoldingServicesDetailState createState() => _ScaffoldingServicesDetailState();
}

class _ScaffoldingServicesDetailState extends State<ScaffoldingServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Services Detail",
        detail: loremIpsum.substring(0,50), btnName: "Continue",onTap: (){

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScaffoldingTimeAndLocation(
          constructionService: widget.constructionService,
        )));

      },showButton: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            PlusMinusContainer(
              extra: "Main Frame",
              dayprice: "SAR 345/day",
            ),
            PlusMinusContainer(
              extra: "Cross Brace",
              dayprice: "SAR 365/day",
            ),
            PlusMinusContainer(
              extra: "Connecting Bar",
              dayprice: "SAR 345/day",
            ),
            PlusMinusContainer(
              extra: "Adjustable Base",
              dayprice: "SAR 365/day",
            ),PlusMinusContainer(
              extra: "Stabilizer",
              dayprice: "SAR 345/day",
            ),
            PlusMinusContainer(
              extra: "Wood Planks",
              dayprice: "SAR 365/day",
            ),

          ],
        ),
      ),
      backgroundColor: Color(0xffffffff),
    );
  }
}
