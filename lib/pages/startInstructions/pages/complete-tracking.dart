import 'package:flutter/material.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/instructionpagewidgit.dart';

class CompleteTracking extends StatefulWidget {
  @override
  _CompleteTrackingState createState() => _CompleteTrackingState();
}

class _CompleteTrackingState extends State<CompleteTracking> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
              children: <Widget>[
                AlignImages(width: 180,height: 180,dy: -0.6,dx:0,imgUrl: "https://images.unsplash.com/photo-1541888946425-d81bb19240f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"),
                AlignImages(width: 100 ,height: 100,dx: -0.4, dy:-0.9,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ193V-ZLuYHP7TAEIFAPBoBYtWYpkGqYlLE2MWeTkh_uI0ov94&usqp=CAU"),
                AlignImages(width: 100,height: 100,imgUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSzqMDMo3x4iv30M6QWuV4e6QZBgnb4-a5576us64Le_DWwHDpd&usqp=CAU",dx: 0.6,dy:-0.3),
               DetailofPage(title: "Complete Tracking",)   ],
            ))
      ],
    );
  }
}
