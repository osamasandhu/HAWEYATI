import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/custom-care.dart';
import 'package:haweyati/pages/building-material/building-material-List.dart';
import 'package:haweyati/pages/dumpster/dumpstersList.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-List.dart';
import 'package:haweyati/pages/notification.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingList.dart';
import 'package:haweyati/pages/vehicles/vehicles-List.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/custom-navigator.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
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
        ),
        leading: IconButton(
            icon: Image.asset(
              "assets/images/home-page-icon.png",
              width: 20,
              height: 20,
            ),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
            }),
        actions: <Widget>[
          IconButton(
              icon: Image.asset(
                "assets/images/customer-care.png",
                width: 20,
                height: 20,
              ),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CustomCare()))),
          IconButton(
              icon: Image.asset(
                "assets/images/notification.png",
                width: 20,
                height: 20,
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NotificationPage())))
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Container(
              color: Color(0xff313f53),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: Text("Arslan Khan",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Center(
                        child: FlatButton.icon(
                            onPressed: null,
                            icon: Image.asset(
                              "assets/images/star.png",
                              width: 20,
                              height: 20,
                            ),
                            label: Text(
                              "Rated 5.0",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _buildListTile("assets/images/order.png", "Your Orders"),
                      _buildListTile("assets/images/ride.png", "Your Rides"),
                      _buildListTile(
                          "assets/images/setting.png", "Your Settings"),
                      _buildListTile(
                          "assets/images/invite.png", "Invite Friends"),
                      _buildListTile(
                          "assets/images/term.png", "Terms and Conditions"),
                      _buildListTile("assets/images/rate.png", "Rate App"),
                    ],
                    padding: EdgeInsets.fromLTRB(0, 100, 0, 10),
                  ),
                  Align(
                    alignment: Alignment(-0.9, -0.95),
                    child: Image.asset(
                      "assets/images/language.png",
                      width: 70,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 0.95),
                    child: Image.asset(
                      "assets/images/logout.png",
                      width: 80,
                    ),
                  )
                ],
              )),
        ),
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
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Align(
                    alignment: Alignment(0.9, -0.45),
                    child: SizedBox(
                        width: 140,
                        height: 120,
                        child: Image.asset(
                          "assets/images/homepageimage.png",
                          fit: BoxFit.cover,
                          width: 70,
                          height: 100,
                        ))),
                Padding(
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
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: EdgeInsets.all(20),
            children: <Widget>[
              _buildContainer(
                  title: "Construction Dumpster",
                  imgPath: "assets/images/dumpster-bg.png",
                  onTap: () =>
                      CustomNavigator.navigateTo(context, DumpsterList())),
              _buildContainer(
                  title: "Scaffolding",
                  imgPath: "assets/images/scaffolding-bg.png",
                  onTap: () =>
                      CustomNavigator.navigateTo(context, ScaffoldingList())),
              _buildContainer(
                title: "Building Material",
                imgPath: "assets/images/building-materials-bg.png",
                onTap: () =>
                    CustomNavigator.navigateTo(context, BuildingMaterialList()),
              ),
              _buildContainer(
                  imgPath: "assets/images/finishing-materials-bg.png",
                  onTap: () {
                    CustomNavigator.navigateTo(
                        context, FisnishingMaterialList());
                  },
                  title: "Finishing Material"),
              _buildContainer(
                  imgPath: "assets/images/delivery-vehaicles-bg.png",
                  onTap: () {
                    CustomNavigator.navigateTo(context, VehicleList());
                  },
                  title: "Vehicles"),
            ],
          ))
        ],
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
            elevation: 0,
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Image.asset(
              "assets/images/cart.png",
              width: 30,
              height: 30,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildListTile(String imgPath, String title) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        width: 20,
        height: 30,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildContainer(
      {String title, Color color, String imgPath, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 5),
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
