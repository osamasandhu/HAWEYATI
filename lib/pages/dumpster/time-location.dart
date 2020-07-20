import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haweyati/auth-pages/signup.dart';
import 'package:haweyati/models/order-model.dart';
import 'package:haweyati/models/order-time_and_location.dart';
import 'package:haweyati/pages/building-material/building-material-List.dart';
import 'package:haweyati/pages/dumpster/calender/custom-datepicker.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locations-map_page.dart';
import '../phoneNumber.dart';

class TimeAndLocation extends StatefulWidget {
  ConstructionService constructionService;
  TimeAndLocation({this.constructionService});
  @override
  _TimeAndLocationState createState() => _TimeAndLocationState();
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  static List<String> timeIntervals = ['6:00am-9:00am', '9:00am-12:00pm' ,'12:pm-3:00pm', '6:00pm-9:00pm', '9:00pm-12:00am'];
  SharedPreferences prefs;
  String selectedInterval = timeIntervals[0];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  File _image;
  DateTime dateTime;
  OrderLocation dropOffLocation;
  String start = "...";
  TimeOfDay _preferredTime;

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

  @override
  void initState() {
    super.initState();
    initTimeAndLocation();
  }

  void initTimeAndLocation() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      dropOffLocation = OrderLocation(
          cords: LatLng(prefs.getDouble('latitude'),prefs.getDouble('latitude')),
          address: prefs.getString('address')
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () async {
                            OrderLocation location = await  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyLocationMapPage(
                                  timeAndLocation: true,
                                )));
                            setState(() {
                              dropOffLocation = location;
                            });
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
                          child: Text(dropOffLocation?.address ?? ''),
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
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color:Color(0xfff2f2f2f2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        DropdownButton<String>(
                          underline: SizedBox(),
                          value: selectedInterval,
                          items: timeIntervals.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text('$value', textAlign: TextAlign.center),
                            );
                          }).toList(),
                          onChanged: (_) {setState(() {
                            selectedInterval = _;
                          });
                          },
                        ),
                      ],)
                  ),
                )   ],
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
                  border: OutlineInputBorder(borderSide: BorderSide(color:Theme.of(context).accentColor),
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
        showButton: true,
        onTap: () async {
          var dumpsterOrder = await Hive.openBox('dumpster');
          print(dumpsterOrder.values);

          if(dateTime==null){
            scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Please select drop off date'),
              behavior: SnackBarBehavior.floating,
            ));
            return;
          }

//          CustomNavigator.navigateTo(context, PhoneNumber());

//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (context) => OrderDetail(
//                time: selectedInterval,
//                date: dateTime.add(Duration(days: 10)),
//                    constructionService: widget.constructionService,
//                  )));
        },
        btnName:tr("Continue")
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
