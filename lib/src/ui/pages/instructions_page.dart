import 'package:flutter/material.dart';
import 'package:haweyati/pages/appHomePage.dart';
import 'package:haweyati/pages/finishing-material/finishing-material-sub-list.dart';
import 'package:haweyati/pages/orderDetail/orderDetail.dart';
import 'package:haweyati/pages/startInstructions/pages/complete-tracking.dart';
import 'package:haweyati/pages/startInstructions/pages/our-products.dart';
import 'package:haweyati/pages/startInstructions/pages/our-services.dart';
import 'package:haweyati/pages/startInstructions/pages/secure-payment.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/custom-navigator.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

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
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
              child: Image.asset(
            "assets/images/language.png",
            width: 100,
          )),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                CustomNavigator.navigateTo(context, FinishingMaterialSubList());
              },
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: <Widget>[
                generateInstructionPage(<Widget>[
                  AlignedImage(
                      dx: -0.55,
                      dy: 0.55,
                      width: 100,
                      height: 100,
                      image: "assets/images/welcome-page-1_image-5.png"),
                  AlignedImage(
                      dx: 0.55,
                      dy: -0.45,
                      width: 100,
                      height: 100,
                      image: "assets/images/welcome-page-1_image-3.png"),
                  AlignedImage(
                      dx: -0.53,
                      dy: -0.55,
                      width: 145,
                      height: 145,
                      image: "assets/images/welcome-page-1_image-2.png"),
                  AlignedImage(
                      dx: -0.79,
                      dy: -0,
                      width: 80,
                      height: 80,
                      image: "assets/images/welcome-page-1_image-4.png"),
                  AlignedImage(
                      dy: 0.0,
                      dx: 0.0,
                      width: 220,
                      height: 220,
                      image: "assets/images/welcome-page-1_image-1.png"),
                  AlignedImage(
                      dx: 0.55,
                      dy: 0.45,
                      width: 130,
                      height: 130,
                      image: "assets/images/welcome-page-1_image-6.png"),
                ], 'Our Services', 'Lorem ipsum dolor sit amet, consectr adipiscing elit, do eiusm webdmstemporasio.'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: 0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-2_image-5.png"),
                AlignedImage(
                    dx: -0.5,
                    dy: 0.50,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-2_image-4.png"),
                AlignedImage(
                    dx: -0.80,
                    dy: -0.15,
                    width: 130,
                    height: 130,
                    image: "assets/images/welcome-page-2_image-2.png"),
                AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image: "assets/images/welcome-page-2_image-3.png"),
                AlignedImage(
                    dx: 0.55,
                    dy: -0.45,
                    width: 150,
                    height: 150,
                    image: "assets/images/welcome-page-2_image-1.png"),
              ], 'Our Products', 'Lorem ipsum dolor sit amet, consectr adipiscing elit, do eiusm webdmstemporasio.'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: 0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-3_image-3.png"),
                AlignedImage(
                    dx: -0.55,
                    dy: -0.45,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-3_image-2.png"),
                AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image: "assets/images/welcome-page-3_image-1.png"),
              ], 'Complete Tracking', 'Lorem ipsum dolor sit amet, consectr adipiscing elit, do eiusm webdmstemporasio.'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: -0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-4_image-1.png"),
                AlignedImage(
                    dx: 0.55,
                    dy: -0.45,
                    width: 100,
                    height: 100,
                    image: "assets/images/welcome-page-4_image-3.png"),
                AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image: "assets/images/welcome-page-4_image-2.png"),
              ], 'Secure Payment', 'Lorem ipsum dolor sit amet, consectr adipiscing elit, do eiusm webdmstemporasio.'),
            ]
          )),

          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(4, (val) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                      _currentPage == val ? Colors.black : Colors.grey
                    ),
                  ),
                );
              })
            ),
          )
        ],
      ),
      floatingActionButton: _currentPage == 3
          ? FloatingActionButton.extended(
              elevation: 0,
              onPressed: () {
                CustomNavigator.navigateTo(context, AppHomePage());
              },
              foregroundColor: Colors.white,
              label: Icon(Icons.arrow_forward),
              icon: Text("Get Started")
            )
          : FloatingActionButton(
              elevation: 0,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                setState(() => ++_currentPage);
                _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
              },
            ),
    );
  }
}

Widget generateInstructionPage(
    List<Widget> widgets, String title, String details) {
  return Column(
    children: <Widget>[
      Expanded(
        child: Center(
          child: Stack(
            children: widgets,
            fit: StackFit.loose,
            alignment: Alignment.center,
          ),
        )
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 10, top: 30),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 60),
        child: Text(details),
      )
    ],
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
