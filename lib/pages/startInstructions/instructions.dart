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
          Expanded(
              child: PageView(
            controller: pageController,
            children: <Widget>[
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: -0.55,
                    dy: 0.55,
                    width: 100,
                    height: 100,
                    image:
                        "assets/images/welcome-page-1_image-5.png"),
                AlignedImage(
                    dx: 0.55,
                    dy: -0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-1_image-3.png"),

                AlignedImage(
                    dx: -0.53,
                    dy: -0.55,
                    width: 145,
                    height: 145,
                    image:
                    "assets/images/welcome-page-1_image-2.png"),
                AlignedImage(
                    dx: -0.79,
                    dy: -0,
                    width: 80,
                    height: 80,
                    image:
                    "assets/images/welcome-page-1_image-4.png"),
                AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image:
                    "assets/images/welcome-page-1_image-1.png"),
                AlignedImage(
                    dx: 0.55,
                    dy: 0.45,
                    width: 130,
                    height: 130,
                    image:
                    "assets/images/welcome-page-1_image-6.png"),

              ], 'Our Services', 'sdf'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: 0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-2_image-5.png"), AlignedImage(
                    dx: -0.5,
                    dy: 0.50,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-2_image-4.png"),
                AlignedImage(
                    dx: -0.80,
                    dy: -0.15,
                    width: 130,
                    height: 130,
                    image:
                    "assets/images/welcome-page-2_image-2.png"),
                AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image:
                    "assets/images/welcome-page-2_image-3.png"),

                AlignedImage(
                    dx: 0.55,
                    dy: -0.45,
                    width: 150,
                    height: 150,
                    image:
                    "assets/images/welcome-page-2_image-1.png"),



              ], 'Our Products', 'sdf'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: 0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-3_image-3.png"),
                AlignedImage(
                    dx: -0.55,
                    dy: -0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-3_image-2.png"),AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image:
                    "assets/images/welcome-page-3_image-1.png"),      ], 'Complete Tracking', 'sdf'),
              generateInstructionPage(<Widget>[
                AlignedImage(
                    dx: -0.55,
                    dy: 0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-4_image-1.png"),    AlignedImage(
                    dx: 0.55,
                    dy: -0.45,
                    width: 100,
                    height: 100,
                    image:
                    "assets/images/welcome-page-4_image-3.png"),AlignedImage(
                    dy: 0.0,
                    dx: 0.0,
                    width: 220,
                    height: 220,
                    image:
                    "assets/images/welcome-page-4_image-2.png"),], 'Secure Payment', 'sdf'),
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
                children: List.generate(4, (val) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentPage == val ? Colors.black : Colors.grey),
                    ),
                  );
                })),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        child:Icon(Icons.arrow_forward,color: Colors.white,size: 35,),
        onPressed: () {
          if (currentPage == 3) {
            CustomNavigator.navigateTo(context, AppHomePage());
          } else {
            pageController.animateToPage(currentPage + 1,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
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
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(details),
      )
    ],
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
