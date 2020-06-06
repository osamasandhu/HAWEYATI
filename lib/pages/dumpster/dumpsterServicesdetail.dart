import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/dumpster/time-location.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';
import 'package:haweyati/widgits/stackButton.dart';

class DumpsterServicesDetail extends StatefulWidget {
  DumpSterModel dumpSterServicesdetail;

  DumpsterServicesDetail({this.dumpSterServicesdetail});

  @override
  _DumpsterServicesDetailState createState() => _DumpsterServicesDetailState();
}

class _DumpsterServicesDetailState extends State<DumpsterServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: HaweyatiAppBody(
        title: "Services Detail",
        detail: "dfbjsdfnsanfasjfpoasjofjapofjopasjfopsajpofjaspo",btnName: "Continue",onTap: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TimeAndLocation(timeAndLocation: widget.dumpSterServicesdetail,)));

      },showButton: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            SubtileContainer(
              name: widget.dumpSterServicesdetail.name,
              onTap: () {},
              subtitle:
                  "${widget.dumpSterServicesdetail.rate}/ ${widget.dumpSterServicesdetail.days}",
            ),
            PlusMinusContainer(
              extra: "Add Extra Days",
              dayprice: widget.dumpSterServicesdetail.priceperday,
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffffffff),
    );
  }
}
