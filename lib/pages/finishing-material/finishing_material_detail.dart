import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/finishing-material/orderGenerate.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/stackButton.dart';


class FinishingMaterialDetail extends StatefulWidget {

ConstructionService constructionService;
FinishingMaterialDetail({this.constructionService});
  @override
  _FinishingMaterialDetailState createState() => _FinishingMaterialDetailState();
}

class _FinishingMaterialDetailState extends State<FinishingMaterialDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xffffffff),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 250,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Plastimul",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "345.00 SR -",
                          //      style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "675.00",
                          //    style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "sdsadsdssssssssssssssssssdasdsad hjabds hj chsch  sc s cos cos coj sojc saojc ojsa cosa cos cosa co saoc saoc aoi sad",
                      style: TextStyle(color: Colors.black54),),
                    SizedBox(
                      height: 20,
                    ),

                    _buildRow(text1: "Weight",
                        color1: Colors.black54,
                        text2: "Colors",
                        color2: Colors.black54)
                    , SizedBox(
                      height: 10,
                    ),

                    _buildRow(text1: "12 and 30kg",
                        color1: Colors.black,
                        text2: "Black",
                        color2: Colors.black)
                  ],
                ),
              ),



              Align(alignment: Alignment(0, 0.9), child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
                child: Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: _buildButton("Add to Cart", null))
                    ,
                    Expanded(flex: 1,
                        child: _buildButton("Buy Now", (){CustomNavigator.navigateTo(context, OrderGenerate());}))
                  ],
                ),
              )
                ,)
//              ,
            ])
    );
  }



  Widget _buildButton(String buttonName ,Function onTap ){return Align(
    alignment: Alignment(0, 0.98),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap:onTap ,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).accentColor),
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(

              buttonName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    ),
  ); }


  Widget _buildRow({String text1, Color color1, String text2, Color color2}) {
    return
      Row(children: <Widget>[
        Expanded(flex: 1, child: Text(text1,
            style: TextStyle(color: color1)

        ),

        ),

        Expanded(flex: 1, child: Text(text2,
            style: TextStyle(color: color2)

        ),

        ),
      ],);
  }


//  Widget _buildButton(
//      {Function btn1Tap, String btnName1, Function btn2Tap, String btnName2,}) {
//    return Align(
//
//      alignment: Alignment(0, 0.98),
//
//      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          GestureDetector(onTap: btn1Tap,
//            child: Expanded(
//              child: Container(
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.circular(30),
//                    color: Theme
//                        .of(context)
//                        .accentColor),
//                height: 50,
//                width: MediaQuery
//                    .of(context)
//                    .size
//                    .width,
//                child: Center(
//                  child: Text(
//
//                    btnName1,
//                    style: TextStyle(
//                        fontWeight: FontWeight.bold, color: Colors.white),
//                  ),
//                ),
//              ),
//            ),
//          ), Expanded(
//            child: GestureDetector(
//              onTap: btn2Tap, child: Container(
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(30),
//                  color: Theme
//                      .of(context)
//                      .accentColor),
//              height: 50,
//              width: MediaQuery
//                  .of(context)
//                  .size
//                  .width,
//              child: Center(
//                child: Text(
//
//                  btnName2,
//                  style: TextStyle(
//                      fontWeight: FontWeight.bold, color: Colors.white),
//                ),
//              ),
//            ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
}