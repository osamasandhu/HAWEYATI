import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';


class SubtileContainer extends StatefulWidget {

  ConstructionService constructionService;
  String name;
  String subtitle;
  Function onTap;
  SubtileContainer({this.name,this.onTap,this.subtitle,this.constructionService});

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
          leading: Image.asset(widget.constructionService.image)
,          title: Text(
            widget.name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              widget.subtitle,
             ),
          )
        ),
      ),
    );
  }
}
