import 'package:flutter/material.dart';


class SubtileContainer extends StatefulWidget {

  String name;
  String subtitle;
  Function onTap;
  SubtileContainer({this.name,this.onTap,this.subtitle});

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
          leading: Container(
            height: 50,
            width: 50,
            color: Colors.greenAccent,
          ),
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
