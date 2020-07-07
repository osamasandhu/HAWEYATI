import 'package:flutter/material.dart';
import 'package:haweyati/models/building-material_model.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/building-material-subList.dart';
import 'package:haweyati/services/building-material_service.dart';
import 'package:haweyati/services/haweyati-service.dart';

import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/simple-future-builder.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildingMaterialListing extends StatefulWidget {
  @override
  _BuildingMaterialListingState createState() =>
      _BuildingMaterialListingState();
}

class _BuildingMaterialListingState extends State<BuildingMaterialListing> {

  Future<List<BuildingMaterials>> buildingMaterials;
  var _service = BuildingMaterialService();
  SharedPreferences prefs;

  @override
  void initState() {
    initBuildingMaterial();
    super.initState();
  }

  Future initBuildingMaterial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      buildingMaterials = _service.getBuildingMaterials();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,
      ),
      body: HaweyatiAppBody(
          title: "Building Material ",
          detail: loremIpsum.substring(0, 70),
          child: SimpleFutureBuilder.simpler(
            future: buildingMaterials,
            context: context,
            builder: (AsyncSnapshot<List<BuildingMaterials>> snapshot){
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  var buildingMaterial = snapshot.data[i];
                  return  ContainerDetailList(
                      name: buildingMaterial.name,
                      imgpath: buildingMaterial.images[0].name,
                      ontap: (){
                        CustomNavigator.navigateTo(context, BuildingMaterialSubList(buildingMaterials: buildingMaterial,));
                      }) ;
                },
              );
            },
          )
      ),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
