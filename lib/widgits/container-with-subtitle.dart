import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/services/haweyati-service.dart';


class SubtileContainer extends StatefulWidget {

  final String image;
  final String name;
  final String subtitle;
  final Function onTap;
  SubtileContainer({this.name,this.onTap,this.subtitle,this.image});

  @override
  _SubtileContainerState createState() => _SubtileContainerState();
}

class _SubtileContainerState extends State<SubtileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color:Color(0xfff2f2f2f2),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListTile(
          onTap: widget.onTap,
          leading: Image.network(HaweyatiService.convertImgUrl(widget.image)),
          title: Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.subtitle,
             ),
          ),
          trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                print("dfds");
              }),
        ),
      ),
    );
  }
}
