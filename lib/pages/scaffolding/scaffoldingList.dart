import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/scaffolding/patented/patentedScaffolding.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/pages/scaffolding/steelScaffolding/ScaffoldingOptions.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class ScaffoldingListing extends StatefulWidget {
  ConstructionService constructionService;
  ScaffoldingListing(this.constructionService);
  @override
  _ScaffoldingListingState createState() => _ScaffoldingListingState();
}

class _ScaffoldingListingState extends State<ScaffoldingListing> {
  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      title: tr("scaffolding"),
      showBackgroundImage: true,
      subtitle: loremIpsum.substring(0,60),
      child: SliverList(delegate: SliverChildListDelegate([





        ContainerDetailList(
          name: "Steel Scaffolding",
          ontap: () {
            CustomNavigator.navigateTo(
                context,
                ScaffoldingOptions
                  (
                    constructionService: new ConstructionService(
                        title: "Steel Scaffolding",
                        image: "assets/images/steelscaffolding.png",
                        detail: ConstructionServiceDetail()
                    )
                )
            );
          },
          imgpath: 'assets/images/steelscaffolding.png',
        ),
        ContainerDetailList(
          name: "Patented Scaffolding",
          ontap: () {
            CustomNavigator.navigateTo(
                context,
                PatentedOptions(
                    constructionService: new ConstructionService(
                        title: "Patented Scaffolding",
                        image: "assets/images/steelscaffolding.png",
                        detail: ConstructionServiceDetail())));
          },
          imgpath: 'assets/images/steelscaffolding.png',
        ),
        ContainerDetailList(
          name: "Single Scaffolding",
          ontap: () {
            CustomNavigator.navigateTo
              (
                context,
                ScaffoldingServicesDetail
                  (
                    constructionService:
                    ConstructionService
                      (
                        title: "Single Scaffolding",
                        image: "assets/images/steelscaffolding.png",
                        detail: ConstructionServiceDetail()
                    )
                )
            );
          },
          imgpath: 'assets/images/steelscaffolding.png',
        )




      ])),
      
      
      
    ) ;
  }
}












