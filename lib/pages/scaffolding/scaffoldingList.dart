import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';
import 'package:haweyati/widgits/service-item-listing.dart';

class ScaffoldingList extends StatefulWidget {

  @override
  _ScaffoldingListState createState() => _ScaffoldingListState();
}

class _ScaffoldingListState extends State<ScaffoldingList> {
  @override
  Widget build(BuildContext context) {
    return ServiceItemListing(pageDetail: "Following Scaffolding",title:"Scaffolding",service: dummyScaffolding,);
  }
}
