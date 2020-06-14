
import 'dart:io';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:haweyati/models/order-model.dart';
import 'package:haweyati/src/utlis/local-data.dart';


import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class ScaffoldingTimeAndLocation extends StatefulWidget {
  ConstructionService constructionService;
  ScaffoldingTimeAndLocation({this.constructionService});
  @override
  _ScaffoldingTimeAndLocationState createState() => _ScaffoldingTimeAndLocationState();
}

class _ScaffoldingTimeAndLocationState extends State<ScaffoldingTimeAndLocation> {
//  File _image;

  String start = "....";


  bool val =false;


  onSwtich(bool newVal){

    setState(() {
      val =newVal;
    });
  }
  @override
  Widget build(BuildContext context) {
//    Future getCamera() async {
//      var image = await ImagePicker.pickImage(source: ImageSource.camera);
//      setState(() {
//        _image = image;
//      });
//    }
//
//    Future getGallery() async {
//      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//      setState(() {
//        _image = image;
//      });
//    }

    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Time & Location",
        detail: loremIpsum.substring(0, 40),
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 100),
          children: <Widget>[
            EmptyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Drop off Location",
                        style: boldText,
                      ),
                      FlatButton.icon(
                          onPressed: (null),
                          icon: Icon(
                            Icons.edit,
                            color: Theme.of(context).accentColor,
                          ),
                          label: Text(
                            "Edit",
                            style:
                            TextStyle(color: Theme.of(context).accentColor),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).accentColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(loremIpsum.substring(0, 40)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildRow(
                dropoffdate: "Drop-off Date", dropofftime: "Drop-off Time"),
            _buildRowwithDetail(
                child1: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("$start"),
                    IconButton(
                      onPressed: ()  {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(1990, 1, 1),
                            maxTime: DateTime(2082, 12, 31), onConfirm: (date) {
                              print('confirm $date');
                              start = ' ${date.day} - ${date.month} - ${date.year} ';
                              setState(() {});
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      icon: Icon(Icons.calendar_today),
                    )
                  ],
                ),
                child2: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("3:00 - 6:00"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.access_time),
                    )
                  ],
                )),
//            TextFormField(
//              scrollPadding: EdgeInsets.only(bottom: 150),
//              maxLength: 80,
//              maxLines: 2,
//              decoration: InputDecoration(
//                  labelText: "Note",
//                  hintText: "Write note here",
//                  border: OutlineInputBorder(
//                      borderRadius: BorderRadius.circular(10))),
//            ),
//            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                FlatButton(
//                    onPressed: () {
//                      getCamera();
//                    },
//                    child: Text("Camera")),
//                FlatButton(
//                    onPressed: () {
//                      getGallery();
//                    },
//                    child: Text("Gallery"))
//              ],
//            ), Container(
//              height: 200.0,
//              child: Center(
//                child: _image == null
//                    ? Text('No image selected.')
//                    : Image.file(_image,fit: BoxFit.cover,),
//              ),
//            ),


            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
              Text("Scaffolding Fixing",style: TextStyle(fontWeight: FontWeight.bold),),
              Switch(value: val, onChanged: (newVal){
                onSwtich(newVal);
              })
            ],),

            Text(loremIpsum.substring(0,90))
          ],
        ),
        showButton: true,
        onTap: () {
          print(widget.constructionService.title);
//          var order = Order(
//            name: widget.constructionService.title
//          );
//          LocalData.addToCart(order);
//
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OrderDetail(
                //constructionService: widget.constructionService,
              )));
        },
        btnName: "Continue",
      ),
    );
  }

  Widget _buildRow({String dropoffdate, String dropofftime}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                dropoffdate,
                style: boldText,
              ),
            )),
        SizedBox(
          width: 20,
        ),
        Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                dropofftime,
                style: boldText,
              ),
            )),
      ],
    );
  }

  Widget _buildRowwithDetail({Widget child1, Widget child2}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(flex: 2, child: EmptyContainer(child: child1)),
        SizedBox(
          width: 10,
        ),
        Expanded(flex: 2, child: EmptyContainer(child: child2)),
      ],
    );
  }
}
