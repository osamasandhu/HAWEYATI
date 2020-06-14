import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haweyati/models/order-model.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:haweyati/widgits/haweyati-appbody.dart';

class TimeAndLocation extends StatefulWidget {
  ConstructionService constructionService;
  TimeAndLocation({this.constructionService});
  @override
  _TimeAndLocationState createState() => _TimeAndLocationState();
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  File _image;
  DateTime dateTime = DateTime.now();

String start = "...";
  @override
  Widget build(BuildContext context) {
    Future getCamera() async {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _image = image;
      });
    }

    Future getGallery() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
      });
    }

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
                      onPressed:  ()  {
                        DatePicker.showDatePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(1990, 1, 1),
                            maxTime: DateTime(2082, 12, 31), onConfirm: (date) {
                          date = date;
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
            TextFormField(
              scrollPadding: EdgeInsets.only(bottom: 150),
              maxLength: 80,
              maxLines: 2,
              decoration: InputDecoration(
                  labelText: "Note",
                  hintText: "Write note here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
GestureDetector(onTap: (){getCamera();}, child: Container(padding: EdgeInsets.all(15), decoration:   BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Theme.of(context).accentColor)), child: Text("Camera",style: TextStyle(color: Theme.of(context).accentColor),),)),
                GestureDetector(onTap: (){getGallery();}, child: Container(padding: EdgeInsets.all(15), decoration:   BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Theme.of(context).accentColor)), child: Text("Gallery",style: TextStyle(color: Theme.of(context).accentColor),),)),
              ],
            ),
            SizedBox(height: 20,),Container(
              height: 200.0,width: 150,
              child: _image == null
                  ? Container(  decoration:   BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Theme.of(context).accentColor)),child: Center(child: Text('No image selected.')))
                  : ClipRRect(borderRadius: BorderRadius.circular(30), child: Image.file(_image,fit: BoxFit.cover,)),
            ),
          ],
        ),
        showButton: true,
        onTap: () {

          var data = widget.constructionService;
          var quantity = int.parse(data.detail.quantity);
          var pricePerDay = int.parse(data.detail.priceperday);
          print(widget.constructionService.title);

          var order = Order(
            name:   data.title,
            image:  data.image,
            price: data.detail.priceperday,
            total: (quantity * pricePerDay).toDouble(),
            dropOffDate: dateTime.toIso8601String(),
            dropOffTime: dateTime.toIso8601String(),
            quantity: 2,
          );

          LocalData.addToCart(order);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OrderDetail(
                    constructionService: widget.constructionService,
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
