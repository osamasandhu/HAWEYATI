import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/pages/orderDetail/pending-order.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/emptyContainer.dart';

class ViewAllOrders extends StatefulWidget {
  @override
  _ViewAllOrdersState createState() => _ViewAllOrdersState();
}

class _ViewAllOrdersState extends State<ViewAllOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: ListView(padding: EdgeInsets.all(10),
        children: <Widget>[
          GestureDetector(onTap: (){CustomNavigator.navigateTo(
              context, PendingOrder(
          //  constructionService: widget.constructionService,
          ));},
            child: EmptyContainer(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildtext("Order Date- 23 March 2020, 12:23 Pm"),
                        Container(decoration: BoxDecoration(                        color: Colors.orange,
                            borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Pending",
                              textAlign: TextAlign.center,style: TextStyle(fontSize: 10,color: Colors.white),
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),

                    SizedBox(height: 10,),
                    _buildtext("Order ID - HW18234",),
                    SizedBox(
                      height: 15,
                    ),
_buildImageRow(),
                    SizedBox(height: 20,),
                    Row(children: <Widget>[_buildtext("Quantity"),_buildtext("1 Piece"),],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
,                  SizedBox(height: 15,),
                    Row(children: <Widget>[_buildtext("Total"),Text("203 SR",style: TextStyle(fontWeight: FontWeight.bold),)],mainAxisAlignment: MainAxisAlignment.spaceBetween,)

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildtext(String text) {
    return Text(text,style: TextStyle(fontSize: 11),);
  }
  Widget _buildImageRow(){
    return Row(
      children: <Widget>[
        Container(width: 60,height: 60,color: Theme.of(context).accentColor,),
                               SizedBox(
          width: 12,
        ),
        Text("Order",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
