import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/scaffolding/ScaffoldingPlusMinusDropContainer.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingTimeLocation.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
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
    return
      ScrollablePage(

        subtitle: loremIpsum.substring(0,36),
        title: "Services Detail",
        action: tr("Continue"),
showButtonBackground: true,
        child: SliverList(delegate: SliverChildListDelegate([
          DropDownContainer(
            extra: "Main Frame",
            dayprice: "SAR 345/day",
          ),
          DropDownContainer(
            extra: "Cross Brace",
            dayprice: "SAR 365/day",
          ),
          DropDownContainer(
            extra: "Connecting Bar",
            dayprice: "SAR 345/day",
          ),
          DropDownContainer(
            extra: "Adjustable Base",
            dayprice: "SAR 365/day",
          ),DropDownContainer(
            extra: "Stabilizer",
            dayprice: "SAR 345/day",
          ),
          DropDownContainer(
            extra: "Wood Planks",
            dayprice: "SAR 365/day",
          ),

        ])),onAction: (){

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
            ScaffoldingTimeAndLocation(
              constructionService: widget.constructionService,
            )));

      },
      );

      Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Services Detail",
        detail: loremIpsum.substring(0,50), btnName:tr("Continue"),onTap:



          (){

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>
            ScaffoldingTimeAndLocation(
          constructionService: widget.constructionService,
        )));

      },



        showButton: true,
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
          children: <Widget>[
            DropDownContainer(
              extra: "Main Frame",
              dayprice: "SAR 345/day",
            ),
            DropDownContainer(
              extra: "Cross Brace",
              dayprice: "SAR 365/day",
            ),
            DropDownContainer(
              extra: "Connecting Bar",
              dayprice: "SAR 345/day",
            ),
            DropDownContainer(
              extra: "Adjustable Base",
              dayprice: "SAR 365/day",
            ),DropDownContainer(
              extra: "Stabilizer",
              dayprice: "SAR 345/day",
            ),
            DropDownContainer(
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
