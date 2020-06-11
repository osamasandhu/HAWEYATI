import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/custom-care.dart';
import 'package:haweyati/pages/building-material/building-material-List.dart';
import 'package:haweyati/pages/dumpster/dumpstersList.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-List.dart';
import 'package:haweyati/pages/notification.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingList.dart';
import 'package:haweyati/pages/vehicles/vehicles-List.dart';
import 'package:haweyati/widgits/custom-navigator.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: AppBar(
        elevation: 0,
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
        ),leading:IconButton(icon: Image.asset(
        "assets/images/home-page-icon.png",
        width: 20,
        height: 20,
      ), onPressed: (){}) ,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/customer-care.png",
              width: 20,
              height: 20,
            ),
            onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomCare()))
          ),
          IconButton(
            icon: Image.asset(
              "assets/images/notification.png",
              width: 20,
              height: 20,
            ),
            onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationPage()))
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 4.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
              color: Color(0xff313f53),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Hello",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Explore our Product And Services",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    //height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).accentColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Text(
                                  "8233 An Najah Khalidiyah District, Jeddah"))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              _buildContainer(
                  imgPath: "assets/images/dumpsterhome.png",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DumpsterList()));
                  },
                  title: "Construction Dumpster"),
              _buildContainer(
                  imgPath: "assets/images/scaffolding.png",
                  onTap: () {
                    CustomNavigator.navigateTo(context, ScaffoldingList());
                  },
                  title: "Scaffolding"),
              _buildContainer(
                  imgPath: "assets/images/building.png",
                  onTap: () {                    CustomNavigator.navigateTo(context, BuildingMaterialList());},
                  title: "Building Material"),
              _buildContainer(
                  imgPath: "assets/images/finishing.png",
                  onTap: () {                    CustomNavigator.navigateTo(context, FisnishingMaterialList());},
                  title: "Finishing Material"),
              _buildContainer(
                  imgPath: "assets/images/vehicles.png",
                  onTap: () {                    CustomNavigator.navigateTo(context, VehicleList());},
                  title: "Vehicles"),
            ],
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xffff974d),
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildContainer(
      {String title, Color color, String imgPath, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child:
       Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 20),
        height: 120,
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(imgPath),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
//      ),
    );
  }
}
