import 'package:flutter/material.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/instructionpagewidgit.dart';

class OurProducts extends StatefulWidget {
  @override
  _OurProductsState createState() => _OurProductsState();
}

class _OurProductsState extends State<OurProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
              children: <Widget>[
//   AlignImages(width: 100 ,height: 100,dx: -0.5, dy:-0.7,imgUrl: "https://image.slidesharecdn.com/scaffolding-productsmanufacturersindia-150418020624-conversion-gate01/95/scaffolding-products-manufacturers-scaffolding-accessories-suppliers-india-4-638.jpg?cb=1429322837"),
//                AlignImages(width: 100,height: 100,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTQZX9a3buGA0_mEv8E54PVDc4nu_toCFUQ1aERe20wXKppPFwo&usqp=CAU",dx: -0.4,dy: -0.1),
//                AlignImages(width: 90,height: 90,imgUrl: "https://i.pinimg.com/originals/16/ff/87/16ff8775c7c367a1b2161ee0b6fd2d22.jpg",dx: 0.4,dy:-0.15),
//                AlignImages(width: 180,height: 180,dy: -0.6,dx:0,imgUrl: "https://image.made-in-china.com/2f0j00UEyflKOPORuD/Steel-Scaffolding-Manufacturer-for-All-Round-System-Scaffold-New-Products.jpg"),
//                AlignImages(dx: 0.6,dy: -0.9,width: 140,height: 140,imgUrl:"https://theconstructor.org/wp-content/uploads/2016/06/single-scaffolding-600x315.jpg"),
                DetailofPage(title: "Our Products",)

    ],
            ))
      ],
    );
  }
}

