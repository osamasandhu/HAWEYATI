import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/productServiceDetail.dart';
import 'package:haweyati/pages/dumpster/dumpsterServicesdetail.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/stackButton.dart';

class BuildingDetail extends StatefulWidget {
  ConstructionService serviceDetail;

  BuildingDetail({this.serviceDetail});
  @override
  _BuildingDetailState createState() => _BuildingDetailState();
}

class _BuildingDetailState extends State<BuildingDetail>with SingleTickerProviderStateMixin {

  PageController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =PageController(initialPage: 0);
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: HaweyatiAppBar(context: context,),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                SizedBox(
                  child: PageView( children: <Widget>[

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: (Image.asset(widget.serviceDetail.image,fit: BoxFit.cover,)),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: (Image.asset(widget.serviceDetail.image,fit: BoxFit.cover,)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: (Image.asset(widget.serviceDetail.image,fit: BoxFit.cover,)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: (Image.asset(widget.serviceDetail.image,fit: BoxFit.cover,)),
                    ),

                  ],controller: controller,),height: 250,width: MediaQuery.of(context).size.width,
                )
                ,
                SizedBox(
                  height: 20,
                ),
                Text(
                  widget.serviceDetail.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.serviceDetail.detail.sr,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.serviceDetail.detail.days,
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.serviceDetail.detail.description),
              ],
            ),
          ),
          StackButton(
            onTap: () {
              CustomNavigator.navigateTo(
                  context, BuildingProductDetail(ConstructionService(title: widget.serviceDetail.title,detail: widget.serviceDetail.detail,image: widget.serviceDetail.image)));
            },
            buttonName: "Rent Now ",
          )
        ],
      ),
    );
  }
}
