import 'package:flutter/material.dart';
import 'package:haweyati/models/finishing-material_category.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/services/finishing-material_service.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/simple-future-builder.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';
import 'finishing-material-sub-list.dart';

class FinishingMaterialListing extends StatefulWidget {
  @override
  _FinishingMaterialListingState createState() =>
      _FinishingMaterialListingState();
}

class _FinishingMaterialListingState extends State<FinishingMaterialListing> {


  Future<List<FinishingMaterial>> finishingMaterial;
  var _service = FinishingMaterialService();

  @override
  void initState() {
    super.initState();
    finishingMaterial = _service.getFinishingMaterial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,
      ),
      body: HaweyatiAppBody(
          title: "Finishing Material",
          detail: loremIpsum.substring(0, 70),
          child: SimpleFutureBuilder.simpler(
            future: finishingMaterial,
            context: context,
            builder: (AsyncSnapshot<List<FinishingMaterial>> snapshot){
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  var fMaterial = snapshot.data[i];
                  return
                    ContainerDetailList(
                      name: fMaterial.name,
                      imgpath: fMaterial.images[0].name,
                      ontap: (){
                        CustomNavigator.navigateTo(context, FinishingMaterialSubList(material: fMaterial,));
                      }) ;
                },
              );
            },
          )
      ),
    );
  }
}
