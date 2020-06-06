import 'package:flutter/material.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/instructionpagewidgit.dart';

class OurServices extends StatefulWidget {
  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
          children: <Widget>[
            AlignImages(dx: 0.6,dy: -0.9,width: 120,height: 120,imgUrl:"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBj8guIvN43Cb0UP6iPxdS4RjBq6YNB5UMZ_a69d08_7T08zCi&usqp=CAU"),
            AlignImages(width: 130 ,height: 130,dx: -0.5, dy:-0.95,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ12MnEqkmgRcPrzFVE2wWJW-14QocUYR6tvJdjPFeu7Cyu98hu&usqp=CAU"),
            AlignImages(width: 80 ,height: 80,dx: -0.6, dy:-0.4,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRQJhbzmNPpZx1HFuFOWdOAIYP4rYudpZZU-hZ7jbhUPyTDwHJ-&usqp=CAU"),
            AlignImages(width: 100,height: 100,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT9BnNmoCUwpVHWbTvoPSL0uOPF2Ue3Kn-Mgx8C1Khl-Gk6Spxn&usqp=CAU",dx: -0.2,dy: -0.1),
            AlignImages(width: 180,height: 180,dy: -0.6,dx:0,imgUrl: "https://www.wanderglobe.org/wp-content/uploads/2019/10/Construction-Materials-Are-Used-for-Buildings.jpg"),
            AlignImages(width: 100,height: 100,imgUrl: "https://image.shutterstock.com/image-illustration/materials-construction-3d-illustration-260nw-619349516.jpg",dx: 0.6,dy:-0.3),
      DetailofPage(title: "Our Services",)

                      ],
        ))
      ],
    );
  }}