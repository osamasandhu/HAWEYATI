import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-sub-list.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class FinishingMaterialListing extends StatefulWidget {
  ConstructionService service;
  FinishingMaterialListing(this.service);
  @override
  _FinishingMaterialListingState createState() =>
      _FinishingMaterialListingState();
}

class _FinishingMaterialListingState extends State<FinishingMaterialListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,
      ),
      body: HaweyatiAppBody(
          title: "Finishing Material",
          detail: loremIpsum.substring(0, 70),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: dummyFinishingMaterial.length,
            itemBuilder: (context, i) {
              return ContainerDetailList(
                name: dummyFinishingMaterial[i].title,
                imgpath: dummyFinishingMaterial[i].image,
                ontap: (){ CustomNavigator.navigateTo(
                    context,
                    FinishingMaterialSubList(dummyFinishingMaterial[i]));},
              );
            },
          )),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
