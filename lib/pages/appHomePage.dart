import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/custom-care.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/building-material-List.dart';
import 'package:haweyati/pages/drawer/haweyati-rewards.dart';
import 'package:haweyati/pages/drawer/haweyati-setting.dart';
import 'package:haweyati/pages/drawer/rate.dart';
import 'package:haweyati/pages/drawer/setting/profile_page.dart';
import 'package:haweyati/pages/drawer/share-invite.dart';
import 'package:haweyati/pages/drawer/term-condition.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-List.dart';
import 'file:///C:/Users/Osama/Workspace/haweyati/lib/notification.dart';
import 'package:haweyati/pages/helpline_page.dart';
import 'package:haweyati/pages/orderDetail/all-orders.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingList.dart';
import 'package:haweyati/pages/vehicles-map_page.dart';
import 'package:haweyati/src/ui/widgets/localization-selector.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../src/ui/pages/services/dumpsters/dumpsters-list_page.dart';
import 'locations-map_page.dart';

class AppHomePage extends StatefulWidget {
  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  String address;
  static List<String> languages = ['English','Arabic',];
  String selectedLanguage = LocalData.currentLng;





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
  void initState() {
    super.initState();
    getAddress();

  }

  getAddress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      address = prefs.getString('address');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          )
        ),
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
        ],        bottom:
      PreferredSize(
        preferredSize: Size.fromHeight(160),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homepageimage.png'),
              fit: BoxFit.scaleDown,
              alignment: Alignment(1, -0.6)
            ),
          ),
          padding: const EdgeInsets.all(15),
          child: Column(children: <Widget>[
            Text(
                tr('hello'),
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),

            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child:
              Text(
                tr('explore'),
                style: TextStyle(color: Colors.white),
              ),
            ),

            CupertinoTextField(
              onTap: () {
                CustomNavigator.navigateTo(context, MyLocationMapPage(editMode: true,));
              },
              padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30)
              ),
              placeholderStyle: TextStyle(
                color: Colors.black
              ),
              placeholder: address ?? '',
              readOnly: true,
              prefix: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Icon(
                  Icons.location_on,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: Container(
          color: Color(0xff313f53),
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
                child: LocalizationSelector(
                  selected: EasyLocalization.of(context).locale,
                  onChanged: (locale) {
                    setState(() => EasyLocalization.of(context).locale = locale);
                  },
                ),
              ),
              GestureDetector(onTap: (){CustomNavigator.navigateTo(context,ProfilePage());},
                child: Container(child: Column(children: <Widget>[Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    radius: 50,
                  ),
                ),
                  SizedBox(height: 15),
                  Center(
                      child: Text("Arslan Khan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          )
                      )
                  ),
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
                        )
                    ),
                  ),],),),
              )
              ,SizedBox(height: 10),

              Expanded(child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  _buildListTile("assets/images/order.png", tr("My_Orders") ,(){
                      CustomNavigator.navigateTo(context, ViewAllOrders());
                  }),
                  //_buildListTile("assets/images/ride.png", "Your Rides",(){CustomNavigator.navigateTo(context, HaweyatiRewards());}),
                  _buildListTile(
                      "assets/images/setting.png", tr("Settings"),(){CustomNavigator.navigateTo(context, HaweyatiSetting());}),
                  _buildListTile(
                      "assets/images/invite.png", tr("Invite_Friends"),(){CustomNavigator.navigateTo(context, ShareInvite());}),
                  _buildListTile("assets/images/order.png", tr("Rewards"),(){CustomNavigator.navigateTo(context, HaweyatiRewards());} ),

                  _buildListTile(
                      "assets/images/term.png", tr("Terms_Conditions"),(){CustomNavigator.navigateTo(context, TermAndCondition());}),
                  _buildListTile("assets/images/rate.png", tr("Rate_App"),(){CustomNavigator.navigateTo(context, Rate());}),
                  _buildListTile("assets/images/logout.png", tr("Logout"),(){
//                        CustomNavigator.navigateTo(context, Rate());
                  }),
                  ListTile(onTap: (){showAlertDialog(context);},
                    leading: Icon(Icons.person_add,color: Colors.white,),title:
                    Text(tr("Register"),style: TextStyle(color: Colors.white,),),dense: true,)
                ]),
              ))
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 245, 15, 10),
        children: <Widget>[
      _buildContainer(
          title:  tr('Construction_Dumpster'),
          imgPath: "assets/images/dumpster-bg.png",
          onTap: () =>
              CustomNavigator.navigateTo(context, DumpstersListPage())),
      _buildContainer(
          title: tr('Scaffolding'),
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
          title: tr('Finishing_Materials'),
      ),
      _buildContainer(
          imgPath: "assets/images/delivery-vehaicles-bg.png",
          onTap: () {
            CustomNavigator.navigateTo(context, VehiclesMapPage());
          },
          title: tr('vehicles')
      ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
            elevation: 5,
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
