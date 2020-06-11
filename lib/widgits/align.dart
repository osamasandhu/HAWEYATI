import 'package:flutter/material.dart';

class AlignedImage extends StatelessWidget {
  final double dx;
  final double dy;
  final double width;
  final double height;

  final String image;

  AlignedImage({
    this.dx,
    this.dy,
    this.width,
    this.height,
    this.image
  }): assert(dx != null),
      assert(dy != null),
      assert(width != null),
      assert(height != null),
      assert(image != null);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(dx, dy),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image)
          ),
//
          borderRadius: BorderRadius.circular(120),
       ),
      ),
    );
  }
}
