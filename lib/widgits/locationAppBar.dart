import 'package:flutter/material.dart';
class LocationAppBar extends AppBar{


  LocationAppBar():super(
      iconTheme: new IconThemeData(color: Colors.white),
      centerTitle: true,
      backgroundColor: Color(0xff313f53),
      title: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset(
          "assets/images/haweyati_logo1.png",
          width: 40,
          height: 40,
        ),
      ),
    leading: IconButton(icon: Icon(Icons.map,color: Colors.white,), onPressed: (null)),


  );
}