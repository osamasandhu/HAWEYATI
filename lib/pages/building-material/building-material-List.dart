import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/building-material-subList.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';

import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class BuildingMaterialListing extends StatefulWidget {
  ConstructionService service;
  BuildingMaterialListing(this.service);
  @override
  _BuildingMaterialListingState createState() =>
      _BuildingMaterialListingState();
}

class _BuildingMaterialListingState extends State<BuildingMaterialListing> {
  @override
  Widget build(BuildContext context) {
    return
ScrollablePage(child:

SliverList(
  delegate: SliverChildBuilderDelegate(
          (context, i) {
        return ContainerDetailList(
          name: dummyBuildingMaterial[i].title,
          imgpath: dummyBuildingMaterial[i].image,

          ontap: () {
            CustomNavigator.navigateTo(
                context,
                BuildingMaterialSubList(
                    dummyBuildingMaterial[i]
                )
            );
          },
        );
      },
      childCount: dummyBuildingMaterial.length
  ),
),title:tr("building"),subtitle: loremIpsum.substring(0,36),);


      Scaffold(
      appBar: HaweyatiAppBar(context: context,
      ),
      body:

      HaweyatiAppBody(
          title: "Building Material ",
          detail: loremIpsum.substring(0, 70),
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: dummyBuildingMaterial.length,
            itemBuilder: (context, i) {
              return

                ContainerDetailList(
                name: dummyBuildingMaterial[i].title,
                ontap: () {
                  CustomNavigator.navigateTo(
                      context,
                      BuildingMaterialSubList(
                      dummyBuildingMaterial[i]
                      )
                  );
                },
                imgpath: dummyBuildingMaterial[i].image,
              );
            },
          )),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}

