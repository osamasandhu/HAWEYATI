//class DumperterServiceDetailPage

//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:haweyati/models/temp-model.dart';
//import 'package:haweyati/pages/dumpster/time-location.dart';
//import 'package:haweyati/src/utlis/const.dart';
//import 'package:haweyati/widgits/appBar.dart';
//import 'package:haweyati/widgits/container-with-add-remove-item.dart';
//import 'package:haweyati/widgits/container-with-subtitle.dart';
//import 'package:haweyati/widgits/haweyati-appbody.dart';
//
import 'package:flutter/cupertino.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/time-location.dart';
import 'package:haweyati/src/ui/widgets/item-count-container.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';
import 'package:haweyati/widgits/custom-navigator.dart';

class DumpsterServicesDetail extends StatelessWidget {
  final ConstructionService constructionService;

  DumpsterServicesDetail({this.constructionService});

  @override
  Widget build(BuildContext context) {
    return ScrollablePage(
      title: 'Service Detail',
      subtitle: loremIpsum.substring(0, 70),
      child: SliverList(delegate: SliverChildListDelegate([
        SubtileContainer(
          name: constructionService.title,
          constructionService: constructionService,
          subtitle: "${constructionService.detail.rate}/ ${constructionService.detail.days}",
        ),
        ItemCountContainer(
          extra: "Add Extra Days",
          dayPrice: constructionService.detail.priceperday,
        )
      ])),

      action: 'Continue',
      onAction: () {
        CustomNavigator.navigateTo(context, TimeAndLocation(constructionService: constructionService));
      }
    );
  }
}

//class _DumpsterServicesDetailState extends State<DumpsterServicesDetail> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: HaweyatiAppBar(context: context,),
//      body: HaweyatiAppBody(
//        title: "Services Detail",
//        detail: loremIpsum.substring(0,50), btnName: tr("Continue"),onTap: (){
//
//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TimeAndLocation(
//constructionService: widget.constructionService,
//          )));
//
//      },showButton: true,
//        child: ListView(
//          padding: EdgeInsets.symmetric(horizontal: 20),
//          children: <Widget>[
//            SubtileContainer(
//              constructionService: widget.constructionService,
//              name: widget.constructionService.title,
//              onTap: () {},
//              subtitle:
//                  "${widget.constructionService.detail.rate}/ ${widget.constructionService.detail.days}",
//            ),
//            PlusMinusContainer(
//              extra: "Add Extra Days",
//              dayprice: widget.constructionService.detail.priceperday,
//            )
//          ],
//        ),
//      ),
//      backgroundColor: Color(0xffffffff),
//    );
//  }
//}
