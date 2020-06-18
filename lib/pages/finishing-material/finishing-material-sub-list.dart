import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/finishing-material/finishing_material_detail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class FinishingMaterialSubList extends StatefulWidget {
 ConstructionService service;
 FinishingMaterialSubList(this.service);

  @override
  _FinishingMaterialSubListState createState() =>
      _FinishingMaterialSubListState();
}

class _FinishingMaterialSubListState extends State<FinishingMaterialSubList> {
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.of(context).pop();},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      content: Text("Server is Required for Performing this Function"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2f2),
      appBar: HaweyatiAppBar(context: context,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.service.image)), ),
                  width: 100,
                  height: 100,
                  
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.service.title,
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Text(
                      "32 items available",
                      style: boldText,
                    )),
                _build(imgPath: "assets/images/grid.png", onTap: () {showAlertDialog(context);}),
                _build(imgPath: "assets/images/search.png", onTap: () {showAlertDialog(context);})
              ],
            ),
            Expanded(
                child: ListView.builder(padding: EdgeInsets.all(10),
                  itemCount: 20,
                  itemBuilder: (build,i){
                  return  ContainerDetailList(
                    imgpath: widget.service.image,
                    name: widget.service.title,
                    ontap: () {

                      print("ds");
                      CustomNavigator.navigateTo(context, FinishingMaterialDetail(constructionService: widget.service,));},
                  );
                },

            ))
          ],
        ),
      ),
    );
  }

  Widget _build({String imgPath, Function onTap}) {
    return IconButton(
      onPressed: onTap,
      icon: Image.asset(imgPath),
    );
  }
}
