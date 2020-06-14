import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class BuildingMaterialListing extends StatefulWidget {

  ConstructionService service;
  BuildingMaterialListing(this.service);
  @override
  _BuildingMaterialListingState createState() => _BuildingMaterialListingState();
}

class _BuildingMaterialListingState extends State<BuildingMaterialListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(showAction: true,),
      body: HaweyatiAppBody(title: "Building Material ",detail: loremIpsum.substring(0,70),
          child:ListView.builder(padding: EdgeInsets.symmetric(horizontal: 20), itemCount: dummyBuildingMaterial.length, itemBuilder: (context,i){
            return   ContainerDetailList(name: dummyBuildingMaterial[i].title,ontap: (){},imgpath: dummyBuildingMaterial[i].image,) ;
          },

          )
      ),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
