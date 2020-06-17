import 'package:flutter/material.dart';

class ContainerDetailList extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  ContainerDetailList({
    this.name,
    this.image,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color: Colors.black38, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            child: Row(
                children: <Widget>[
                  SizedBox(
                      height: 70,
                      width: 70,
                      child: Image.asset(image)),
                  Expanded(child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                  Icon(Icons.arrow_forward_ios)
                ]),
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          )

      ),
    );
  }
}
