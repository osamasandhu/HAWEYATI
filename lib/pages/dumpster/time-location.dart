import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class TimeAndLocation extends StatefulWidget {
  DumpSterModel timeAndLocation;

  TimeAndLocation({this.timeAndLocation});
  @override
  _TimeAndLocationState createState() => _TimeAndLocationState();
}

class _TimeAndLocationState extends State<TimeAndLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: HaweyatiAppBody(
        title: "Time & Location",
        detail: "kdjhfkdsnfklashfklaslfjaslkfjlaskjflasjfliasjflasjflasj",
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
                          child: Text(
                              "dijdmlkdsmfldmsl;fmdl;m;slccccdm;f mdcfd cff f ff f "),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

            _buildRow(
                dropoffdate: "Drop-off Date", dropofftime: "Drop-off Time"),


            _buildRowwithDetail(
                child1:
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("17 April 2020"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.calendar_today),
                )
              ],
            ),child2: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("3:00 - 6:00"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.access_time),
                )
              ],
            )
            ),

            TextFormField(scrollPadding: EdgeInsets.only(bottom: 150), maxLength: 80,maxLines: 2, decoration: InputDecoration( labelText: "Note",hintText: "Write note here",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),)
          ],
        ),
        showButton: true, onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderDetail(orderDetail: widget.timeAndLocation,)));},
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
          width: 20,
        ),
        Expanded(flex: 2, child: EmptyContainer(child: child2)),
      ],
    );
  }
}
