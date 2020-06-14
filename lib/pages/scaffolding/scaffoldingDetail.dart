import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/dumpster/dumpsterServicesdetail.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

class ScaffoldingDetail extends StatefulWidget {
  ConstructionService serviceDetail;

  ScaffoldingDetail({this.serviceDetail});
  @override
  _ScaffoldingDetailState createState() => _ScaffoldingDetailState();
}

class _ScaffoldingDetailState extends State<ScaffoldingDetail> {
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
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(widget.serviceDetail.image))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.serviceDetail.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
//                SizedBox(
//                  height: 15,
//                ),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      widget.serviceDetail.detail.sr,
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                    ),
//                    SizedBox(
//                      width: 10,
//                    ),
//                    Text(
//                      widget.serviceDetail.detail.days,
//                      style: TextStyle(color: Colors.black54),
//                    )
//                  ],
//                ),
                SizedBox(
                  height: 20,
                ),
                Text(loremIpsum),
              ],
            ),
          ),
          StackButton(
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScaffoldingServicesDetail(constructionService: widget.serviceDetail,

                  )));
            },
            buttonName: "Rent Now",
          )
        ],
      ),
    );
  }
}
