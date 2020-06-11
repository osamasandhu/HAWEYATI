import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class ServiceItemListing extends StatefulWidget {
  String title;
  String pageDetail;
  List<ConstructionService> service;

  ServiceItemListing({ this.service,this.title,this.pageDetail});
  @override
  _ServiceItemListingState createState() => _ServiceItemListingState();
}

class _ServiceItemListingState extends State<ServiceItemListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(showAction: true,),
      body: HaweyatiAppBody(title: widget.title,detail: widget.pageDetail,
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            itemCount: widget.service.length,
            itemBuilder: (_, i) {
              return ContainerDetailList(
                name: widget.service[i].title ,imgpath: widget.service[i].image,
                  ontap: ()=> CustomNavigator.navigateTo(
                      context, ServicesItemDetail(
                serviceDetail: widget.service[i],
              )));
            }
            ),
      ),
      backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
