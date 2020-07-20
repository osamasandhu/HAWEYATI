import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/pages/dumpster/time-location.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:hive/hive.dart';

class DumpsterServicesDetail extends StatefulWidget {
 final Dumpster dumpsters;
 DumpsterServicesDetail({this.dumpsters});
  @override
  _DumpsterServicesDetailState createState() => _DumpsterServicesDetailState();
}

class _DumpsterServicesDetailState extends State<DumpsterServicesDetail> {

  int extraDay = 0;
  double price;

  @override
  void initState() {
    super.initState();
    price = widget.dumpsters.pricing[0].extraDayRent;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Services Detail",
        detail: loremIpsum.substring(0,50),
        btnName: tr("Continue"),onTap: (){

        var box = Hive.box('dumpster');
        if(extraDay!=0){
          box.put('extra_days', extraDay);
          box.put('extra_day_price', price * extraDay);
        }

        CustomNavigator.navigateTo(context, TimeAndLocation());
         },
        showButton: true,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: <Widget>[
            SubtileContainer(
              image: widget.dumpsters.image.name,
              name: widget.dumpsters.size,
              onTap: () {

              },
              subtitle: "${widget.dumpsters.pricing[0].rent} / ${widget.dumpsters.pricing[0].days}",
            ),
            PlusMinusContainer(
              onValueChange: (int val){
                setState(() {
                  extraDay=val;
                });
              },
              extra: "Add Extra Days",
              dayprice: 'Price: ' + (price * extraDay).toString(),
            )
          ],
        ),
      ),
      backgroundColor: Color(0xffffffff),
    );
  }
}
