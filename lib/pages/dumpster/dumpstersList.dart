import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class DumpsterListing extends StatefulWidget {

  ConstructionService service;
  DumpsterListing(this.service);
  @override
  _DumpsterListingState createState() => _DumpsterListingState();
}

class _DumpsterListingState extends State<DumpsterListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(showAction: true,),
      body: HaweyatiAppBody(title: "Construction Dumpster ",detail: loremIpsum.substring(0,70),
          child:ListView.builder(padding: EdgeInsets.symmetric(horizontal: 20),itemCount: dummyDumpster.length, itemBuilder: (context,i){
            return   ContainerDetailList(name: dummyDumpster[i].title,imgpath: dummyDumpster[i].image,ontap: (){}) ;
          },

          )
      ),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
