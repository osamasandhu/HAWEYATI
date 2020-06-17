import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/scaffolding/patented/patentedScaffolding.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/pages/scaffolding/steelScaffolding/ScaffoldingOptions.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class ScaffoldingListing extends StatefulWidget {
  ConstructionService service;
  ScaffoldingListing(this.service);
  @override
  _ScaffoldingListingState createState() => _ScaffoldingListingState();
}

class _ScaffoldingListingState extends State<ScaffoldingListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(
        context: context,
      ),
      body: HaweyatiAppBody(
          title: "Scaffolding",
          detail: loremIpsum.substring(0, 70),
          child: ListView(
            children: <Widget>[
              ContainerDetailList(
                name: "Steel Scaffolding",
                ontap: () {
                  CustomNavigator.navigateTo(context, ScaffoldingOptions());
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),
              ContainerDetailList(
                name: "Patented Scaffolding",
                ontap: () {
                  CustomNavigator.navigateTo(context, PatentedOptions());
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),

              ContainerDetailList(
                name: "Single Scaffolding",
                ontap: () {
                  CustomNavigator.navigateTo(context, ScaffoldingServicesDetail());
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),
            ],
            padding: EdgeInsets.symmetric(horizontal: 20),
//            itemBuilder: (context, i) {
//              return ContainerDetailList(
//                name: dummyScaffolding[i].title,
//                imgpath: dummyScaffolding[i].image,
//                ontap: () {
//                  CustomNavigator.navigateTo(
//                      context,
//                      ScaffoldingOptions(
//                        constructionService:  dummyScaffolding[i],
//                      ));
//                },
//              );
            // },
          )),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
