import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/scaffolding/patented/patentedScaffolding.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/pages/scaffolding/steelScaffolding/ScaffoldingOptions.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class ScaffoldingListing extends StatefulWidget {
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
                  CustomNavigator.navigateTo(context, ScaffoldingOptions(constructionService: new ConstructionService(
                  title: "Steel Scaffolding",
                  image: "assets/images/steelscaffolding.png",
                  detail: ConstructionServiceDetail())));
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),
              ContainerDetailList(
                name: "Patented Scaffolding",
                ontap: () {
                  CustomNavigator.navigateTo(context, PatentedOptions(constructionService: new ConstructionService(
                      title: "Patented Scaffolding",
                      image: "assets/images/steelscaffolding.png",
                      detail: ConstructionServiceDetail(

                      ))));
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),

              ContainerDetailList(
                name: "Single Scaffolding",
                ontap: () {
                  CustomNavigator.navigateTo(context, ScaffoldingServicesDetail(constructionService: new ConstructionService(
                      title: "Single Scaffolding",
                      image: "assets/images/steelscaffolding.png",
                      detail: ConstructionServiceDetail(

                      ))));
                },
                imgpath: 'assets/images/steelscaffolding.png',
              ),
            ],
            padding: EdgeInsets.symmetric(horizontal: 20),
          )),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
