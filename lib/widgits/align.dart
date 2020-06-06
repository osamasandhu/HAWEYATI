import 'package:flutter/material.dart';

class AlignImages extends StatefulWidget {
  double dx; double dy; String imgUrl; double height; double width;
  AlignImages({this.width,this.imgUrl,this.height,this.dx,this.dy});

  @override
  _AlignImagesState createState() => _AlignImagesState();
}

class _AlignImagesState extends State<AlignImages> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment(widget.dx,widget.dy),
        child: Material(
          elevation: 16,borderRadius: BorderRadius.circular(120),
          child: Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                image: new DecorationImage(
                  image: NetworkImage(
                    widget.imgUrl,
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(120),
                border: Border.all(color: Colors.white, width: 4)

            ),
          ),
        ));
  }
}
