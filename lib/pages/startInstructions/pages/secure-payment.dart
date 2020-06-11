import 'package:flutter/material.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/instructionpagewidgit.dart';

class SecurePayment extends StatefulWidget {
  @override
  _SecurePaymentState createState() => _SecurePaymentState();
}

class _SecurePaymentState extends State<SecurePayment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
          children: <Widget>[
//            AlignImages(width: 180, height: 180, dy: -0.6, dx: 0, imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRxWcWVVGV7sh1Jk8OFewBfUGy3W2m9EuX60czrrUdC0yWucfNG&usqp=CAU"),
//            AlignImages(width: 100, height: 100, dx: 0.4, dy: -0.9, imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTE0lhYfn2DZVYi3C3EVEMO-aPhXfS0lZad1EOWgh1DH9Ir2Dyk&usqp=CAU"),
//             AlignImages(dx: -0.6, dy: -0.23, width: 100, height: 100, imgUrl: "https://www.vapulus.com/en/wp-content/uploads/2018/11/Qaiware-payment-magic-thegem-blog-default.jpg"),
            DetailofPage(title: "Secure Payment",
            ),
          ],
        ))
      ],
    );
  }
}
