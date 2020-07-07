import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/payment/visa.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';



enum PaymentMeths{
  Mada,
  Apple,
  CreditCard,
  COD,
}

class PaymentMethod extends StatefulWidget {
  ConstructionService constructionService;
  PaymentMethod({this.constructionService});

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}



class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedIndex = -1;
  PaymentMeths paymentMeths;

  void func(){
    switch(paymentMeths){

      case PaymentMeths.Mada:
        // TODO: Handle this case.
        break;
      case PaymentMeths.Apple:
        // TODO: Handle this case.
        break;
      case PaymentMeths.CreditCard:
        // TODO: Handle this case.
        break;
      case PaymentMeths.COD:
        // TODO: Handle this case.
        break;
    }
  }

  bool selected = false;


  @override
  Widget build(BuildContext context) {
    return
      ScrollablePage(title: "Payment Method",subtitle: loremIpsum.substring(0,115),action: "Done",showButtonBackground: true,child: SliverList(delegate: SliverChildListDelegate([
        _buildPaymentContainer(
            imgPath: "assets/images/mada.png", onTap: () => setState(() => _selectedIndex = 0), text: "Mada", index: 0),
        _buildPaymentContainer(
            imgPath: "assets/images/apple-pay.png", onTap: () => setState(() => _selectedIndex = 1), text: "Apple", index: 1),
        _buildPaymentContainer(
            imgPath: "assets/images/credit-card.png", onTap: () => setState(() => _selectedIndex = 2), text: "Credit Card ", index: 2),
        _buildPaymentContainer(
            imgPath: "assets/images/cash-on-delivery.png", onTap: () => setState(() => _selectedIndex = 3), text: "Cash on Delivery", index: 3)

      ])),onAction:  () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => VisaCard(
              constructionService: widget.constructionService,
            )));
      },);
      Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VisaCard(
                    constructionService: widget.constructionService,
                  )));
        },
        showButton: true,
        btnName: "Done",
        title: "Payment Method",
        detail:
        loremIpsum.substring(0,40),
        child: ListView(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
          children: <Widget>[
            _buildPaymentContainer(
                imgPath: "assets/images/mada.png", onTap: () => setState(() => _selectedIndex = 0), text: "Mada", index: 0),
            _buildPaymentContainer(
                imgPath: "assets/images/apple-pay.png", onTap: () => setState(() => _selectedIndex = 1), text: "Apple", index: 1),
            _buildPaymentContainer(
                imgPath: "assets/images/credit-card.png", onTap: () => setState(() => _selectedIndex = 2), text: "Credit Card ", index: 2),
            _buildPaymentContainer(
                imgPath: "assets/images/cash-on-delivery.png", onTap: () => setState(() => _selectedIndex = 3), text: "Cash on Delivery", index: 3)
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentContainer({Function onTap, String text,String imgPath, int index}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: _selectedIndex == index ? Theme.of(context).accentColor: Colors.grey, width: _selectedIndex == index ? 2: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  text,
                  style: boldText,
                ),
                Container(
                  height: 50,
                  width: 50,
child: Image.asset(imgPath),                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
