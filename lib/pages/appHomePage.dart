//import 'package:flutter/widgets.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:haweyati/models/available-services_model.dart';
//import 'package:haweyati/pages/drawer/rate.dart';
//import 'package:haweyati/pages/drawer/share-invite.dart';
//import 'package:haweyati/services/service-availability_service.dart';
//import 'package:easy_localization/easy_localization.dart';
//import 'package:haweyati/pages/drawer/term-condition.dart';
//import 'package:haweyati/pages/orderDetail/all-orders.dart';
//import 'package:haweyati/src/utlis/simple-future-builder.dart';
//import 'package:haweyati/widgits/custom-navigator.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:haweyati/pages/drawer/haweyati-rewards.dart';
//import 'package:haweyati/pages/drawer/haweyati-setting.dart';
//import 'package:haweyati/src/ui/widgets/localization-selector.dart';
//
//class HomePage extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  final _service = ServiceAvailability();
//  final _drawerKey = GlobalKey<ScaffoldState>();
//
//  String _address = 'Loading ....';
//  Future<AvailableServices> _availableServices;
//
//  @override
//  void initState() {
//    super.initState();
//
//    SharedPreferences.getInstance().then((prefs) {
//      this._address = prefs.getString('address');
//      setState(() {
//        this._availableServices = _service.getAvailableServices(
//            LatLng(prefs.getDouble('latitude'), prefs.getDouble('longitude'))
//        );
//      });//..then((value) => this.setState(() => prefs.setString('city', value.city)));
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      key: _drawerKey,
//      backgroundColor: Colors.white,
//      appBar: AppBar(
//        elevation: 0,
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//              bottomRight: Radius.circular(30),
//              bottomLeft: Radius.circular(30),
//            )
//        ),
//        iconTheme: new IconThemeData(color: Colors.white),
//        centerTitle: true,
//        backgroundColor: Color(0xff313f53),
//        title: Padding(
//          padding: const EdgeInsets.all(18.0),
//          child: Image.asset(
//            "assets/images/haweyati_logo1.png",
//            width: 40,
//            height: 40,
//          ),
//        ),
//        leading: IconButton(
//            icon: Image.asset(
//              "assets/images/home-page-icon.png",
//              width: 20,
//              height: 20,
//            ),
//            onPressed: () => _drawerKey.currentState.openDrawer()
//        ),
//        actions: <Widget>[
//          IconButton(
//              icon: Image.asset(
//                "assets/images/customer-care.png",
//                width: 20,
//                height: 20,
//              ),
//              onPressed: () => Navigator.of(context).pushNamed('/helpline')
//          ),
//          IconButton(
//              icon: Image.asset(
//                "assets/images/notification.png",
//                width: 20,
//                height: 20,
//              ),
//              ///TODO: Fix This.
////            onPressed: () => Navigator.of(context).pushNamed('/notifications')
//              onPressed: () => Navigator.of(context).pushNamed('/scaffoldings-list')
//          )
//        ],
//        bottom: PreferredSize(
//          preferredSize: Size.fromHeight(160),
//          child: Container(
//            decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('assets/images/homepageimage.png'),
//                  fit: BoxFit.scaleDown,
//                  alignment: Alignment(1, -0.6)
//              ),
//            ),
//            padding: const EdgeInsets.all(15),
//            child: Column(children: <Widget>[
//              Text(tr('hello'), style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold)),
//              Padding(padding: const EdgeInsets.only(top: 8, bottom: 20), child: Text(tr('explore'), style: TextStyle(color: Colors.white))),
//
//              CupertinoTextField(
//                onTap: () => Navigator.of(context).pushNamed('/location'),
//                padding: EdgeInsets.fromLTRB(5, 13, 5, 13),
//                decoration: BoxDecoration(
//                    color: Colors.white,
//                    borderRadius: BorderRadius.circular(30)
//                ),
//                placeholderStyle: TextStyle(color: Colors.black),
//                placeholder: this._address,
//                readOnly: true,
//                prefix: Padding(
//                  padding: const EdgeInsets.only(left: 8, right: 8),
//                  child: Icon(
//                    Icons.location_on,
//                    color: Theme.of(context).accentColor,
//                  ),
//                ),
//              ),
//            ], crossAxisAlignment: CrossAxisAlignment.start),
//          ),
//        ),
//      ),
//      extendBodyBehindAppBar: true,
//      drawer: Drawer(
//        child: Container(
//          color: Color(0xff313f53),
//          constraints: BoxConstraints.expand(),
//          child: Padding(
//            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
//            child: Column(children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(left: 10, top: 5, right: 10),
//                child: LocalizationSelector(
//                  selected: EasyLocalization.of(context).locale,
//                  onChanged: (locale) {
//                    setState(() => EasyLocalization.of(context).locale = locale);
//                  },
//                ),
//              ),
//              Center(
//                child: CircleAvatar(
//                  backgroundColor: Colors.white,
//                  foregroundColor: Colors.white,
//                  radius: 50,
//                ),
//              ),
//              SizedBox(height: 15),
//              Center(
//                  child: Text("Arslan Khan",
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontSize: 18,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold
//                      )
//                  )
//              ),
//              Center(
//                child: FlatButton.icon(
//                    onPressed: null,
//                    icon: Image.asset(
//                      "assets/images/star.png",
//                      width: 20,
//                      height: 20,
//                    ),
//                    label: Text(
//                      "Rated 5.0",
//                      style: TextStyle(color: Colors.white),
//                    )
//                ),
//              ),
//              SizedBox(height: 10),
//
//              Expanded(child: SingleChildScrollView(
//                child: Column(children: <Widget>[
//                  _buildListTile("assets/images/order.png", tr("My_Orders") ,(){
//                    CustomNavigator.navigateTo(context, ViewAllOrders());
//                  }),
//                  //_buildListTile("assets/images/ride.png", "Your Rides",(){CustomNavigator.navigateTo(context, HaweyatiRewards());}),
//                  _buildListTile(
//                      "assets/images/setting.png", tr("Settings"),(){CustomNavigator.navigateTo(context, HaweyatiSetting());}),
//                  _buildListTile(
//                      "assets/images/invite.png", tr("Invite_Friends"),(){CustomNavigator.navigateTo(context, ShareInvite());}),
//                  _buildListTile("assets/images/order.png", tr("Rewards"),(){CustomNavigator.navigateTo(context, HaweyatiRewards());} ),
//
//                  _buildListTile(
//                      "assets/images/term.png", tr("Terms_Conditions"),(){CustomNavigator.navigateTo(context, TermAndCondition());}),
//                  _buildListTile("assets/images/rate.png", tr("Rate_App"),(){CustomNavigator.navigateTo(context, Rate());}),
//                  _buildListTile("assets/images/logout.png", tr("Logout"),() {}),
//                  ListTile(onTap: (){/*showAlertDialog(context);*/},
//                    leading: Icon(Icons.person_add,color: Colors.white,),title:
//                    Text(tr("Register"),style: TextStyle(color: Colors.white,),),dense: true,)
//                ]),
//              ))
//            ], crossAxisAlignment: CrossAxisAlignment.start),
//          ),
//        ),
//      ),
//
//      body: Padding(
//        padding: const EdgeInsets.fromLTRB(10, 230, 10, 0),
//        child: CustomScrollView(slivers: <Widget>[
//          CupertinoSliverRefreshControl(
//            onRefresh: () async => this._availableServices,
//          ),
//          SliverToBoxAdapter(child: SizedBox(height: 17)),
//          SimpleFutureBuilder.simplerSliver(
//              showLoading: false,
//              context: context,
//              future: this._availableServices,
//              builder: (AsyncSnapshot<AvailableServices> snapshot) {
//                if (snapshot.data.services.isEmpty) {
//                  return SliverToBoxAdapter(child: Text('No services are yet available in your region'));
//                } else {
//                  return SliverList(delegate: SliverChildBuilderDelegate(
//                          (context, i) => _ServiceContainer(snapshot.data.services[i]),
//                      childCount: snapshot.data.services.length
//                  ));
//                }
//              }
//          )
//        ]),
//      ),
//      floatingActionButton: SizedBox(
//        width: 65,
//        height: 65,
//        child: FloatingActionButton(
//            elevation: 5,
//            backgroundColor: Colors.white,
//            onPressed: () {CustomNavigator.navigateTo(context, ViewAllOrders());},
//            child: Image.asset(
//              "assets/images/cart.png",
//              width: 30,
//              height: 30,
//              color: Colors.black,
//            )
//        ),
//      ),
//    );
//  }
//
//  Widget _buildListTile(String imgPath, String title,Function onTap) {
//    return ListTile(
//      dense: true,
//      onTap: onTap,
//      leading: Image.asset(imgPath, width: 20, height: 30),
//      title: Text(title, style: TextStyle(color: Colors.white)),
//    );
//  }
//}
//
//class _ServiceContainerDetail {
//  final String page;
//  final String title;
//  final String image;
//
//  const _ServiceContainerDetail({
//    this.page,
//    this.title,
//    this.image
//  });
//}
//class _ServiceContainer extends StatelessWidget {
//  final String service;
//  _ServiceContainer(this.service);
//
//  final _map = {
//    'Construction Dumpster': const _ServiceContainerDetail(
//        title: 'Construction_Dumpster',
//        image: 'dumpster-bg.png',
//        page: '/dumpsters-list'
//    ),
//    'Scaffolding': const _ServiceContainerDetail(
//        title: 'Scaffolding',
//        image: 'scaffolding-bg.png',
//        page: '/scaffoldings-list'
//    ),
//    'Building Material': const _ServiceContainerDetail(
//        title: 'building',
//        image: 'building-materials-bg.png',
//        page: '/building-materials-list'
//    ),
//    'Finishing Material': const _ServiceContainerDetail(
//        title: 'Finishing_Materials',
//        image: 'finishing-materials-bg.png',
//        page: '/finishing-materials-list'
//    ),
//    'Delivery Vehicle': const _ServiceContainerDetail(
//        title: 'vehicles',
//        image: 'delivery-vehaicles-bg.png',
//        page: '/scaffoldings-list'
//    )
//  };
//
//  @override
//  Widget build(BuildContext context) {
//    final service = _map[this.service];
//
//    return GestureDetector(
//        onTap: () => Navigator.of(context).pushNamed(service.page),
//        child: Container(
//          width: MediaQuery.of(context).size.width,
//          height: 120,
//          decoration: new BoxDecoration(
//              image: new DecorationImage(
//                image: new AssetImage('assets/images/' + service.image),
//                fit: BoxFit.fill,
//              ),
//              borderRadius: BorderRadius.circular(20)
//          ),
//          child: Center(
//            child: Text(tr(service.title), style: TextStyle(
//                fontSize: 18,
//                color: Colors.white,
//                fontWeight: FontWeight.bold
//            )),
//          ),
//        )
//    );
//  }
//}
//
