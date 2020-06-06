import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/pages/payment/visa.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class PaymentMethod extends StatefulWidget {
  DumpSterModel paymentMethod;
  PaymentMethod({this.paymentMethod});
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: HaweyatiAppBody(
 onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VisaCard(visaCard: widget.paymentMethod,)));},showButton: true,btnName: "Done",       title: "Payment Method",
        detail:
            "Payent Methodskdnlan lksmflsan klnclkanl lk clk lka lka lkc lk alk lk",
        child: ListView(padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
          children: <Widget>[
            _buildPaymentContainer(
                color: Colors.red, onTap: () {}, text: "Mada")

       ,     _buildPaymentContainer(
                color: Colors.greenAccent, onTap: () {}, text: "Apple")
,     _buildPaymentContainer(
                color: Colors.teal, onTap: () {}, text: "Credit Card ")
,     _buildPaymentContainer(
                color: Colors.amber, onTap: () {}, text: "Cash on Delivery")


          ],
        ),
      ),
    );
  }

  Widget _buildPaymentContainer({Function onTap, String text, Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Theme.of(context).accentColor, width: 1),
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
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
