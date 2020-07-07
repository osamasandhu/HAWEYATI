import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'file:///C:/Users/Osama/Workspace/haweyati/lib/src/ui/pages/services/dumpsters/dumpsters-list_page.dart';
import 'package:haweyati/pages/payment/payment-method.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/date-formatter.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'file:///C:/Users/Osama/Workspace/haweyati/lib/src/ui/pages/services/dumpsters/dumpsters-list_page.dart';

import 'package:haweyati/widgits/service-item-listing.dart';

class OrderDetail extends StatefulWidget {
  DateTime date;
  String time;
  ConstructionService constructionService;
  OrderDetail({this.constructionService,this.date,this.time});

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return 

    ScrollablePage(title: "Orders",subtitle: loremIpsum.substring(0,120),onAction: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PaymentMethod(
            constructionService: widget.constructionService,
          )));
    },action: tr("Continue"),showButtonBackground: true,child: SliverList(delegate: SliverChildListDelegate([

      EmptyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Services Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
//                              CustomNavigator.navigateTo(context, DumpsterListing());

                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).accentColor,
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(
                          color: Theme.of(context).accentColor),
                    ))
              ],
            ),
            Row(
              children: <Widget>[
                Image.asset(widget.constructionService.image ?? "",width: 60,height: 60,)??null
                ,                        SizedBox(
                  width: 12,
                ),
                Text(
                  widget.constructionService.title,
                  style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Price",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Text(
                    "Quantity",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Text(
                    "Helper",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  flex: 2,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(widget.constructionService.detail.rate),
                  flex: 4,
                ),
                Expanded(
                  child: Text("100 piece"),
                  flex: 3,
                ),
                Expanded(
                  child: Text("No"),
                  flex: 2,
                ),
              ],
            )
          ],
        ),
      ),
      EmptyContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Time & Location",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).accentColor,
                    ),
                    label: Text(
                      "Edit",
                      style: TextStyle(
                          color: Theme.of(context).accentColor),
                    ))
              ],
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton.icon(
                onPressed: (null),
                icon: Icon(
                  Icons.location_on,
                  color: Theme.of(context).accentColor,
                ),
                label: Expanded(
                  child: Text(loremIpsum.substring(0,60),
                  ),
                )),
            SizedBox(
              height: 30,
            ),
            _buildHeadRow(
                text1: "Drop-off-Date", text2: "Drop-off-Time"),
            SizedBox(
              height: 15,
            ),
            _builddetailRow(
                text1: formattedDate(widget.date), text2: widget.time),
            SizedBox(
              height: 30,
            ),
            _buildHeadRow(text1: "Pick-up-Date", text2: "Pick-up-Time"),
            SizedBox(
              height: 15,
            ),
            _builddetailRow(text1: formattedDate(widget.date.add(Duration(days: 10))), text2: widget.time)

/////////////////////////////,
          ],
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(
        widget.constructionService.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      SizedBox(
        height: 10,
      ),
      _buildRow(type: "Price", detail: "345.00 Sar"),
      _buildRow(type: "Quantity", detail: "1 Piece"),
      _buildRow(type: "Service Days", detail: "11 Days"),
      _buildRow(type: "Delivery fee", detail: "50.00 SAR"),SizedBox(height: 8,),

      Row(children: <Widget>[ Text("Total", style: TextStyle(color: Colors.blueGrey),),Text("515.00 SR",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)


    ])),);

      Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: HaweyatiAppBar(context: context,),
        body: 
        
        HaweyatiAppBody(
          title: "Orders",
          btnName: tr("Continue"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PaymentMethod(
             constructionService: widget.constructionService,
                    )));
          },
          showButton: true,
          detail: loremIpsum.substring(0,60,),
          child: ListView(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 100),
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
                          "Services Detail",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        FlatButton.icon(
                            onPressed: (){
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
//                              CustomNavigator.navigateTo(context, DumpsterListing());

                              },
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).accentColor,
                            ),
                            label: Text(
                              "Edit",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    ),
                    Row(
                      children: <Widget>[
Image.asset(widget.constructionService.image ?? "",width: 60,height: 60,)??null
,                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          widget.constructionService.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Price",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          child: Text(
                            "Quantity",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Text(
                            "Helper",
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(widget.constructionService.detail.rate),
                          flex: 4,
                        ),
                        Expanded(
                          child: Text("100 piece"),
                          flex: 3,
                        ),
                        Expanded(
                          child: Text("No"),
                          flex: 2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              EmptyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Time & Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        FlatButton.icon(
                            onPressed: (){
                              Navigator.pop(context);

                            },
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).accentColor,
                            ),
                            label: Text(
                              "Edit",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FlatButton.icon(
                        onPressed: (null),
                        icon: Icon(
                          Icons.location_on,
                          color: Theme.of(context).accentColor,
                        ),
                        label: Expanded(
                          child: Text(loremIpsum.substring(0,60),
                          ),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    _buildHeadRow(
                        text1: "Drop-off-Date", text2: "Drop-off-Time"),
                    SizedBox(
                      height: 15,
                    ),
                    _builddetailRow(
                        text1: formattedDate(widget.date), text2: widget.time),
                    SizedBox(
                      height: 30,
                    ),
                    _buildHeadRow(text1: "Pick-up-Date", text2: "Pick-up-Time"),
                    SizedBox(
                      height: 15,
                    ),
                    _builddetailRow(text1: formattedDate(widget.date.add(Duration(days: 10))), text2: widget.time)

/////////////////////////////,
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.constructionService.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              _buildRow(type: "Price", detail: "345.00 Sar"),
              _buildRow(type: "Quantity", detail: "1 Piece"),
              _buildRow(type: "Service Days", detail: "11 Days"),
              _buildRow(type: "Delivery fee", detail: "50.00 SAR"),SizedBox(height: 8,),

Row(children: <Widget>[ Text("Total", style: TextStyle(color: Colors.blueGrey),),Text("515.00 SR",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),) ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)            ],
          ),
        ));
  }

  Widget _buildRow({
    String type,
    String detail,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Text(
            type,
            style: TextStyle(color: Colors.blueGrey),
          ),
          Text(
            detail,
            style:
                TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }

  Widget _buildHeadRow({String text1, String text2}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            text1,
            style: TextStyle(color: Colors.blueGrey),
          ),
          flex: 4,
        ),
        Expanded(
          child: Text(
            text2,
            style: TextStyle(color: Colors.blueGrey),
          ),
          flex: 3,
        ),
      ],
    );
  }

  Widget _builddetailRow({String text1, String text2}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            text1,
          ),
          flex: 4,
        ),
        Expanded(
          child: Text(
            text2,
          ),
          flex: 3,
        ),
      ],
    );
  }
}
