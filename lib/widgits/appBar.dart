

import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/pages/orderDetail/all-orders.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
class HaweyatiAppBar extends AppBar{
  ConstructionService service;
 bool showCart;
 bool showHome;

  HaweyatiAppBar({BuildContext context, double progress = 0.0, this.showCart = true,this.showHome=true}):super(

      brightness:Brightness.dark,
  elevation:0,  iconTheme: new IconThemeData(color: Colors.white),
         centerTitle: true,
         backgroundColor: Color(0xff313f53),
         title: Padding(
           padding: const EdgeInsets.all(18.0),
           child: Image.asset(
             "assets/images/haweyati_logo1.png",
             width: 40,
             height: 40,
           ),
         ),actions:[
 showHome? FlatButton(
   child:
  Icon(Icons.home,size: 30,color: Colors.white,),onPressed: (){  Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AppHomePage(address: '',)),
            (Route<dynamic> route) => false);
    },):Container(),

      showCart? IconButton(icon: Image.asset("assets/images/cart.png"),onPressed: (){CustomNavigator.navigateTo(context,ViewAllOrders());},):Container()


      ],
     bottom:PreferredSize(child: Container (height: 3, child: LinearProgressIndicator(value: progress,backgroundColor: Colors.transparent,)))

 );
}