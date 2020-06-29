import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/time-location.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class DumpsterServicesDetail extends StatefulWidget {
 ConstructionService constructionService;
 DumpsterServicesDetail({this.constructionService});
  @override
  _DumpsterServicesDetailState createState() => _DumpsterServicesDetailState();
}

class _DumpsterServicesDetailState extends State<DumpsterServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Services Detail",
        detail: loremIpsum.substring(0,50), btnName: tr("Continue"),onTap: (){

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TimeAndLocation(
constructionService: widget.constructionService,
          )));

      },showButton: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            SubtileContainer(
              constructionService: widget.constructionService,
              name: widget.constructionService.title,
              onTap: () {},
              subtitle:
                  "${widget.constructionService.detail.rate}/ ${widget.constructionService.detail.days}",
            ),
            PlusMinusContainer(
              extra: "Add Extra Days",
              dayprice: widget.constructionService.detail.priceperday,
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffffffff),
    );
  }
}
