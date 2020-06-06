import 'package:flutter/material.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/pages/startInstructions/pages/complete-tracking.dart';
import 'package:haweyati/pages/startInstructions/pages/our-products.dart';
import 'package:haweyati/pages/startInstructions/pages/our-services.dart';
import 'package:haweyati/pages/startInstructions/pages/secure-payment.dart';

class StartInstructions extends StatefulWidget {
  @override
  _StartInstructionsState createState() => _StartInstructionsState();
}

class _StartInstructionsState extends State<StartInstructions> {
  int currentPage = 0;
  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            icon: Icon(Icons.fiber_manual_record), onPressed: (null)),
        actions: <Widget>[FlatButton(onPressed: (null), child: Text("Skip",style: TextStyle(color: Colors.white),))],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: PageView(
            controller: pageController,
            children: <Widget>[
              OurServices(),
              OurProducts(),
              SecurePayment(),
              CompleteTracking(),
            ],
            onPageChanged: (int val) {
              setState(() {
                currentPage = val;
              });
            },
          )),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            height: 60,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(4, (val){
                  return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: currentPage == val ? Colors.red : Colors.grey,
                          shape: BoxShape.circle),
                    ),
                  );
                })
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {







          if (currentPage == 3) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppHomePage()));
          } else {
            pageController.animateToPage(currentPage + 1,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeIn);
          }
        },
      ),
    );
  }
}
