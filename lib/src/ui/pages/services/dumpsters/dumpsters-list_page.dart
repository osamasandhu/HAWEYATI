import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class DumpstersListPage extends ScrollablePage {
  DumpstersListPage(): super(
    title: "Construction Dumpster",
    subtitle: loremIpsum.substring(0, 70),

    child: SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          return ContainerDetailList(
            name: dummyDumpster[i].title,
            imgpath: dummyDumpster[i].image,

            ontap: () {
              CustomNavigator.navigateTo(context, ServicesItemDetail(serviceDetail: dummyDumpster[i]));
            }
          );
        },
        childCount: dummyDumpster.length
      ),
    )
  );
}
