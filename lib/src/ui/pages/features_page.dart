import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/pages/map/location.dart';
import 'package:haweyati/src/ui/pages/location/pre-location_page.dart';
import 'package:haweyati/src/ui/widgets/localization-selector.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeaturesPage extends StatefulWidget {
  @override
  _FeaturesPageState createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  int _currentPage = 0;
  PageController _controller;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      final firstTime = value.getBool("firstTime") ?? true;
      if (!firstTime) Navigator.of(context).pushReplacementNamed('/');
    });

    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          titleSpacing: 5,
          automaticallyImplyLeading: false,
          title: Row(children: <Widget>[
            LocalizationSelector(
              selected: EasyLocalization.of(context).locale,
              onChanged: (locale) {
                setState(() => EasyLocalization.of(context).locale = locale);
              }
            ),
            Expanded(child: Icon(Icons.add))
          ]),
          actions: <Widget>[
            _currentPage != 3? SizedBox(
              width: 70,
              child: FlatButton(
                textColor: Colors.white,
                child: Text(tr("skip")),
                onPressed: () =>  CustomNavigator.navigateTo(context, PreLocationPage()) // Navigator.of(context).pushNamed('/pre-location')
              ),
            ): Container(width: 70)
          ],
        ),

        body: PageView(
          children: <Widget>[
            _FeatureView(
              title: tr("Our_Services"),
              image: '1',
              detail: tr('services_detail')
            ),
            _FeatureView(
              title: tr("Our_product"),
              image: '2',
              detail: tr('product_detail')
            ),
            _FeatureView(
              title: tr("Truck"),
              image: '3',
              detail: tr('truck_detail')
            ),
            _FeatureView(
              title: tr("Payment"),
              image: '4',
              detail: tr('payment_detail')
            ),
          ],
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),

        floatingActionButton: GestureDetector(
          onTap: () {
            print(_currentPage);
            if (_currentPage != 3)
              _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
            else Navigator.of(context).pushNamed('/pre-location');
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),

            width: _currentPage == 3? 138 :60,
            height: _currentPage == 3? 45 :60,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(_currentPage == 3? 23: 35)
            ),
            child: _currentPage == 3? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(children: <Widget>[
                Expanded(
                  flex: 10,
                  child: Text("Get Started", style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ), overflow: TextOverflow.ellipsis),
                ),
                Expanded(flex: 1, child: Container()),
                Image.asset("assets/images/icons/next-feature.png", width: 20)
              ]),
            ): Center(child: Image.asset("assets/images/icons/next-feature.png", width: 30)),
          )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: SizedBox(
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(children: <Widget>[
              _FeatureViewIndicator(_currentPage == 0),
              _FeatureViewIndicator(_currentPage == 1),
              _FeatureViewIndicator(_currentPage == 2),
              _FeatureViewIndicator(_currentPage == 3)
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }
}

class _FeatureView extends Column {
  _FeatureView({
    String image,
    String title,
    String detail
  }): super(children: [
    Expanded(child: Center(
      child: Transform.scale(
        scale: 0.8,
        child: Image.asset("assets/images/welcome-page/feature-$image.png")
      )
    )),
    Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: Text(title, style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      )),
    ),
    Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 60),
      child: Text(detail),
    )
  ], crossAxisAlignment: CrossAxisAlignment.start);
}

class _FeatureViewIndicator extends Container {
  _FeatureViewIndicator(bool selected): super(
    width: 7,
    height: 7,
    margin: const EdgeInsets.only(left: 5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: selected ? Color(0xff313f53) : Colors.grey.shade300
    )
  );
}
