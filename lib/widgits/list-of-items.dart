import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';

class ContainerDetailList extends StatefulWidget {
String imgpath;
  Function ontap;
  String name;
  ContainerDetailList({this.name,this.ontap,this.imgpath});


  @override
  _ContainerDetailListState createState() => _ContainerDetailListState();
}

class _ContainerDetailListState extends State<ContainerDetailList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: widget.ontap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: Colors.grey.shade300
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ListTile(
              leading:
              Image.asset(widget.imgpath,width: 60),
                title: Text(
                widget.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios)
            ),
          ),
        ),
      ),
    );
  }
}
