import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class DumpsterList extends StatefulWidget {

  @override
  _DumpsterListState createState() => _DumpsterListState();
}

class _DumpsterListState extends State<DumpsterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(showAction: true,),
      body: HaweyatiAppBody(title: "Construction Dumpster",detail: "Detais,nflsakmnfklasnfklasnf;nsa;lmfl;samf;lamslf;msa;lmf;almf;hihklnlkklhlkhklhklhkljhlhlkhlkhilhlil",
        child: ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            itemCount: dumpsterdummy.length,
            itemBuilder: (_, i) {
              return ContainerDetailList(
                name: dumpsterdummy[i].name,ontap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DumpsterDetail(
                      dumpSterdetail: dumpsterdummy[i],
                    )));
              },);
            }),),
      backgroundColor: Color(0xfff2f2f2f2),
    );
  }
}
