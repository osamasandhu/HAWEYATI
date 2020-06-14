import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class DumpsterListing extends StatefulWidget {
  String title;
  String pageDetail;
  List<ConstructionService> service;

  DumpsterListing({ this.service,this.title,this.pageDetail});
  @override
  _DumpsterListingState createState() => _DumpsterListingState();
}

class _DumpsterListingState extends State<DumpsterListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,
      ),
      body: HaweyatiAppBody(title: "Construction Dumpster ",
        child:ListView(children: <Widget>[

          ContainerDetailList(name: "12 Yard",)
        ],)
      ),
    //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
