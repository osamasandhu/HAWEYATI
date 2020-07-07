import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/models/pricing_model.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterServicesdetail.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/stackButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesItemDetail extends StatefulWidget {
  final Dumpsters dumpster;
  ServicesItemDetail({this.dumpster});
  @override
  _ServicesItemDetailState createState() => _ServicesItemDetailState();
}

class _ServicesItemDetailState extends State<ServicesItemDetail> {
  SharedPreferences prefs;
  Pricing pricing;
  @override
  void initState() {
    super.initState();
    initDetail();
  }

  initDetail() async {
    var prefs = await SharedPreferences.getInstance();
    widget.dumpster.pricing.forEach((element) {
      if(element.city== prefs.getString('city')){
        setState(() {
          pricing = element;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffffffff),
      appBar: HaweyatiAppBar(context: context,),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: (Image.network(HaweyatiService.convertImgUrl(widget.dumpster.images[0].name),fit: BoxFit.cover,)),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.dumpster.size,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      pricing?.rent.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      pricing?.days.toString(),
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.dumpster.description),
              ],
            ),
          ),
          StackButton(
            onTap: () {
//              Navigator.of(context).push(MaterialPageRoute(
//                  builder: (context) => DumpsterServicesDetail(constructionService: widget.serviceDetail,
//
//                      )));
            },
            buttonName: "Rent Now",
          )
        ],
      ),
    );
  }
}
