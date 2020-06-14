import 'package:flutter/material.dart';
class HaweyatiAppBar extends AppBar{
 bool showAction;

  HaweyatiAppBar({double progress = 0.0, this.showAction = false}):super(
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
 showAction? IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){},):Container()
 ],
     bottom:PreferredSize(child: Container (height: 3, child: LinearProgressIndicator(value: progress,backgroundColor: Colors.transparent,)))

 );
}