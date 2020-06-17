import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:haweyati/models/order-model.dart';
import 'package:haweyati/pages/dumpster/calender/custom-datepicker.dart';
import 'package:haweyati/pages/map-page.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:haweyati/widgits/haweyati-appbody.dart';

class TimeAndLocation extends StatefulWidget {
  ConstructionService constructionService;
  TimeAndLocation({this.constructionService});
  @override
  _TimeAndLocationState createState() => _TimeAndLocationState();
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  File _image;
  DateTime dateTime;

  String start = "...";
  TimeOfDay _preferredTime;
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
      key: scaffoldKey,
      appBar: HaweyatiAppBar(
        context: context,
      ),
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
                          onPressed: () {
                            CustomNavigator.navigateTo(
                                context, MyLocationMapPage());
                          },
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
            Row(
              children: <Widget>[
                Expanded(
                  child: DatePickerField(
                    onChanged: (date) => dateTime = date,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: EmptyContainer(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[


                      _preferredTime!=null ? Text("${_preferredTime.hour}:${_preferredTime.minute}") : Text(" Select Time"),
IconButton(icon: Icon(Icons.access_time),onPressed:


    () async {
  FocusScope.of(context).nextFocus();
  TimeOfDay t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
  );
  if(t != null)
    setState(() {
      _preferredTime = t;
    });
},)
                    ],)
                  ),
                )
              ],
            ),

            
            
            Text("Take a photo for contact less deliver and make sure to pay online.",style: boldText,)
           ,
            SizedBox(height: 15,),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      getCamera();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 2, color: Theme.of(context).accentColor)),
                      child: Text(
                        "Camera",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      getGallery();
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 2, color: Theme.of(context).accentColor)),
                      child: Text(
                        "Gallery",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200.0,
              width: 150,
              child: _image == null
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              width: 2, color: Theme.of(context).accentColor)),
                      child: Center(child: Text('No image selected.')))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        _image,
                        fit: BoxFit.cover,
                      )),
            ),
            SizedBox(
              height: 25,
            ),            TextFormField(
              scrollPadding: EdgeInsets.only(bottom: 150),
              maxLength: 80,
              maxLines: 2,
              decoration: InputDecoration(
                  labelText: "Note",
                  hintText: "Write note here",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
        showButton: true,
        onTap: () {
          if(dateTime==null){
            scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Please select drop off date'),
              behavior: SnackBarBehavior.floating,
            ));
            return;
          }
          if(_preferredTime==null){
            scaffoldKey.currentState.showSnackBar(SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text('Please select drop off time'),
            ));
            return;
          }
          var data = widget.constructionService;
          var quantity = int.parse(data.detail.quantity);
          var pricePerDay = int.parse(data.detail.priceperday);
          print(widget.constructionService.title);

          var order = Order(
            name: data.title,
            image: data.image,
            price: data.detail.priceperday,
            total: (quantity * pricePerDay).toDouble(),
            dropOffDate: dateTime.toIso8601String(),
            dropOffTime: dateTime.toIso8601String(),
            quantity: 2,
          );

          LocalData.addToCart(order);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => OrderDetail(
                time: _preferredTime,
                date: dateTime.add(Duration(days: 10)),
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
        Expanded(flex: 2, child: child1),
        SizedBox(
          width: 10,
        ),
        Expanded(flex: 2, child: EmptyContainer(child: child2)),
      ],
    );
  }
}
