
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:haweyati/models/order-model.dart';
import 'package:haweyati/pages/dumpster/calender/custom-datepicker.dart';
import 'package:haweyati/pages/scaffolding/order.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:haweyati/widgits/custom-navigator.dart';


import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

import '../locations-map_page.dart';

class ScaffoldingTimeAndLocation extends StatefulWidget {
  ConstructionService constructionService;
  ScaffoldingTimeAndLocation({this.constructionService});
  @override
  _ScaffoldingTimeAndLocationState createState() => _ScaffoldingTimeAndLocationState();
}

class _ScaffoldingTimeAndLocationState extends State<ScaffoldingTimeAndLocation> {
//  File _image;

  DateTime dateTime;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String start = "...";
  TimeOfDay _preferredTime;


  bool val =false;


  onSwtich(bool newVal){

    setState(() {
      val =newVal;
    });
  }


  static List<String> timeIntervals = ['6:00am-9:00am', '9:00am-12:00pm' ,'12:pm-3:00pm', '6:00pm-9:00pm', '9:00pm-12:00am'];
  String selectedInterval = timeIntervals[0];
  @override
  Widget build(BuildContext context) {

    return

      ScrollablePage(title: "Time & Location",showButtonBackground: true,action: tr("Continue"),subtitle: loremIpsum.substring(0,150),onAction:
          () {
        if(dateTime==null){
          scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Please select drop off date'),
            behavior: SnackBarBehavior.floating,
          ));
          return;
        }


        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScaffoldingOrderDetail(
              time: selectedInterval,
              date: dateTime,
              constructionService: widget.constructionService,
            )));
      },key: scaffoldKey, child: SliverList(delegate: SliverChildListDelegate([


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
                          child: SizedBox(
                              width: 150,
                              child: Text('$value', textAlign: TextAlign.center)
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {setState(() {
                        selectedInterval = _;
                      });
                      },
                    ),
                  ],)
              ),
            )
          ],
        ),

        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
          Text("Scaffolding Fixing",style: TextStyle(fontWeight: FontWeight.bold),),
          Switch(value: val, onChanged: (newVal){
            onSwtich(newVal);
          })
        ],),



      ])),);
      Scaffold(
key: scaffoldKey,      appBar: HaweyatiAppBar(context: context,),
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
                              child: SizedBox(
                                width: 150,
                                child: Text('$value', textAlign: TextAlign.center)
                              ),
                            );
                          }).toList(),
                          onChanged: (_) {setState(() {
                            selectedInterval = _;
                          });
                          },
                        ),
                      ],)
                  ),
                )
              ],
            ),

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
          if(dateTime==null){
            scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Please select drop off date'),
              behavior: SnackBarBehavior.floating,
            ));
            return;
          }


          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ScaffoldingOrderDetail(
time: selectedInterval,
                date: dateTime,
                constructionService: widget.constructionService,
              )));
          },
        btnName: tr("Continue"),
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


