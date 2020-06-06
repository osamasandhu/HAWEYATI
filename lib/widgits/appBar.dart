import 'package:flutter/material.dart';
class HaweyatiAppBar extends AppBar{
 bool showAction;

  HaweyatiAppBar({this.showAction = false}):super(
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
 showAction? IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),):Container()
 ],
     bottom:PreferredSize(child: Container (height: 3, child: LinearProgressIndicator(value: .7,backgroundColor: Colors.transparent,)))

 );
}