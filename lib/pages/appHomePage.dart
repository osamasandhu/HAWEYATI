import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/custom-care.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/building-material-List.dart';
import 'package:haweyati/pages/drawer/haweyati-rewards.dart';
import 'package:haweyati/pages/drawer/haweyati-setting.dart';
import 'package:haweyati/pages/drawer/rate.dart';
import 'package:haweyati/pages/drawer/share-invite.dart';
import 'package:haweyati/pages/drawer/term-condition.dart';
import 'package:haweyati/pages/dumpster/dumpstersList.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-List.dart';
import 'package:haweyati/pages/drawer/setting/notification.dart';
import 'package:haweyati/pages/helpline_page.dart';
import 'package:haweyati/pages/orderDetail/all-orders.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingList.dart';
import 'package:haweyati/pages/vehicles-map_page.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'dumpster/dumpstersList.dart';
import 'locations-map_page.dart';

class AppHomePage extends StatefulWidget {
  String address;
  AppHomePage({this.address});
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  static List<String> languages = ['English','Arabic',];
  String selectedLanguage = languages[0];



  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { Navigator.of(context).pop();},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
      content: Text("This Functionality will be available after Supplier App is develop."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


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
                  .push(MaterialPageRoute(builder: (context) => HelplinePage()))),
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
                      height: 15,
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
                    _buildListTile("assets/images/order.png", "My Orders" ,(){
                        CustomNavigator.navigateTo(context, ViewAllOrders());
                    }),
                    //_buildListTile("assets/images/ride.png", "Your Rides",(){CustomNavigator.navigateTo(context, HaweyatiRewards());}),
                    _buildListTile(
                        "assets/images/setting.png", "Your Settings",(){CustomNavigator.navigateTo(context, HaweyatiSetting());}),
                    _buildListTile(
                        "assets/images/invite.png", "Invite Friends",(){CustomNavigator.navigateTo(context, ShareInvite());}),
                    _buildListTile("assets/images/order.png", "Rewards",(){CustomNavigator.navigateTo(context, HaweyatiRewards());} ),

                    _buildListTile(
                        "assets/images/term.png", "Terms and Conditions",(){CustomNavigator.navigateTo(context, TermAndCondition());}),
                    _buildListTile("assets/images/rate.png", "Rate App",(){CustomNavigator.navigateTo(context, Rate());}),
                    _buildListTile("assets/images/logout.png", "Logout",(){
//                        CustomNavigator.navigateTo(context, Rate());
                    }),
                    
                    ListTile(onTap: (){showAlertDialog(context);}, leading: Icon(Icons.person_add,color: Colors.white,),title: Text("Register as Supplier",style: TextStyle(color: Colors.white,),),dense: true,)
                  ],
                  padding: EdgeInsets.fromLTRB(0, 70, 0, 10),
                ),
                Align(
                  alignment: Alignment(-0.9, -0.95),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      canvasColor: Color(0xff313f53),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropdownButton<String>(
                        underline: SizedBox(),                value: selectedLanguage,
                        items: languages.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Image.asset('assets/images/$value.png',height: 30,width: 60, color:Colors.white,),
                          );
                        }).toList(),
                        onChanged: (_) {setState(() {
                          EasyLocalization.of(context).locale = Locale(_=='English' ? 'en' : 'ar');

                          selectedLanguage=_;
                        });

                        },
                      ),
                    ),
                  ),
                ),

              ],
            )),
      ),
      body: Column(
        children: <Widget>[
          Container(
           height: MediaQuery.of(context).size.height / 4.8,
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
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          tr('hello'),
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        tr('explore'),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 18),
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
                                  child: GestureDetector(onTap: (){

                                    CustomNavigator.navigateTo(context, MyLocationMapPage());
                                  },
                                    child: Text(
                                        widget.address ?? '',overflow: TextOverflow.ellipsis,),
                                  ))
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
            padding: EdgeInsets.fromLTRB(20, 6, 20, 10),
            children: <Widget>[
              _buildContainer(
                  title:  tr('construction_dumpster'),
                  imgPath: "assets/images/dumpster-bg.png",
                  onTap: () =>
                      CustomNavigator.navigateTo(context,DumpsterListing(ConstructionService()))),
              _buildContainer(
                  title: tr('scaffolding'),
                  imgPath: "assets/images/scaffolding-bg.png",
                  onTap: () =>
                      CustomNavigator.navigateTo(context, ScaffoldingListing(ConstructionService()))),
              _buildContainer(
                title: tr('building'),
                imgPath: "assets/images/building-materials-bg.png",
                onTap: () =>
                    CustomNavigator.navigateTo(context, BuildingMaterialListing(ConstructionService())),
              ),
              _buildContainer(
                  imgPath: "assets/images/finishing-materials-bg.png",
                  onTap: () {
                    CustomNavigator.navigateTo(
                        context,FinishingMaterialListing(ConstructionService()) );
                  },
                  title: tr('finishing_material'),
              ),
              _buildContainer(
                  imgPath: "assets/images/delivery-vehaicles-bg.png",
                  onTap: () {
                    CustomNavigator.navigateTo(context, VehiclesMapPage());
                  },
                  title: tr('vehicles')
              ),
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
            onPressed: () {CustomNavigator.navigateTo(context, ViewAllOrders());},
            child: Image.asset(
              "assets/images/cart.png",
              width: 30,
              height: 30,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildListTile(String imgPath, String title,Function onTap) {
    return ListTile(onTap: onTap,dense: true,
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
 //       margin: EdgeInsets.only(bottom: 1),
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
