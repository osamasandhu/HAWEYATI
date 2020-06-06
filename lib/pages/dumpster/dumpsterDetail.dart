import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/pages/dumpster/dumpsterServicesdetail.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/stackButton.dart';

class DumpsterDetail extends StatefulWidget {
  DumpSterModel dumpSterdetail;

  DumpsterDetail({this.dumpSterdetail});
  @override
  _DumpsterDetailState createState() => _DumpsterDetailState();
}

class _DumpsterDetailState extends State<DumpsterDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
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
                  color: Colors.greenAccent,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.dumpSterdetail.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.dumpSterdetail.rate,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.dumpSterdetail.days,
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.dumpSterdetail.detail),
              ],
            ),
          ),
          StackButton(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DumpsterServicesDetail(
                        dumpSterServicesdetail: widget.dumpSterdetail,
                      )));
            },
            buttonName: "Rent Now",
          )
        ],
      ),
    );
  }
}
