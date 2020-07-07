import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/services/dumpsters_service.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/simple-future-builder.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DumpsterListing extends StatefulWidget {
  @override
  _DumpsterListingState createState() => _DumpsterListingState();
}

class _DumpsterListingState extends State<DumpsterListing> {

  Future<List<Dumpsters>> dumpsters;
  var _service = DumpstersService();
  SharedPreferences prefs;
  

  @override
  void initState() {
    initDumpsters();
    super.initState();
  }

  Future initDumpsters() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      dumpsters = _service.getDumpsters(prefs.getString('city'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xfff2f2f2),
      appBar: HaweyatiAppBar(context: context,
      ),
      body: HaweyatiAppBody(title: "Construction Dumpster ",detail: loremIpsum.substring(0,70),
          child: SimpleFutureBuilder.simpler(
            future: dumpsters,
            context: context,
            builder: (AsyncSnapshot<List<Dumpsters>> snapshot){
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: snapshot.data.length,
                itemBuilder: (context,i){
                  var dumpster = snapshot.data[i];
                return  ContainerDetailList(
                    name: dumpster.size,
                    imgpath: dumpster.images[0].name,
                    ontap: (){
                      CustomNavigator.navigateTo(context, ServicesItemDetail(dumpster: dumpster));}) ;
              },
              );
            },
          )
      ),
      //  backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
