import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-sub-list.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
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
    return ScrollablePage(child:

    SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, i) {
            return ContainerDetailList(
              name: dummyFinishingMaterial[i].title,
              imgpath: dummyFinishingMaterial[i].image,

              ontap: () {
                CustomNavigator.navigateTo(
                    context,
                    FinishingMaterialSubList(
                        dummyFinishingMaterial[i]
                    )
                );
              },
            );
          },
          childCount: dummyFinishingMaterial.length
      ),
    ),title:tr("finishing_material"),subtitle: loremIpsum.substring(0,36),);
    ;
  }
}
