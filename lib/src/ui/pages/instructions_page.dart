import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:haweyati/pages/map/location.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/custom-navigator.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  int _currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);
  static List<String> languages = ['English','Arabic'];
  String selectedLanguage = LocalData.currentLng;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 2,
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff313f53),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Color(0xff313f53),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: DropdownButton<String>(
                underline: SizedBox(),
                  value: selectedLanguage,
                  items: languages.map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: Image.asset('assets/images/$value.png',height: 30 ,width: 80, color:Colors.white,),
                    );
                  }).toList(),
                  onChanged: (_) {setState(() {
                    EasyLocalization.of(context).locale = Locale(_=='English' ? 'en' : 'ar');
                    LocalData.currentLng = selectedLanguage = _;
                    LocalData.write();
                  });

                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                "assets/images/haweyati_logo1.png",
                width: 40,
                height: 40,
              ),
            ),

            FlatButton(
                onPressed: () {
                  CustomNavigator.navigateTo(context, Location());
                  //CustomNavigator.navigateTo(context, AppHomePage());

                },
                child: Text(
                  tr("skip"),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ))
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(image:DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/pattern.png")) ),
        child: Column(
          children: <Widget>[
            Expanded(child:
            PageView(
              onPageChanged: (int val){
                setState(() {
                  _currentPage = val;
                });
              },
               // physics: NeverScrollableScrollPhysics(),
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
                  ], tr('Our_Services'),
                      tr("services_detail")),
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
                ], tr("Our_product"),
tr("product_detail")
                ),
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
                ],
                    tr("Truck"),
                    tr("truck_detail")),
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
                ],
                    tr("Payment"), 
                    tr("payment_detail")),
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
      ),
      floatingActionButton: _currentPage == 3
          ? FloatingActionButton.extended(
              elevation: 0,
              onPressed: () {
              CustomNavigator.navigateTo(context, Location());
              },
              foregroundColor: Colors.white,
              label: Icon(Icons.arrow_forward),
              icon: Text("Ge")
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
                _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
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
        padding: const EdgeInsets.fromLTRB(16, 30, 16, 10),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 60, right: 16),
        child: Text(details),
      )
    ],
    crossAxisAlignment: CrossAxisAlignment.start,
  );
}
