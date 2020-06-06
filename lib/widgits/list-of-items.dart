import 'package:flutter/material.dart';

class ContainerDetailList extends StatefulWidget {

  Function ontap;
  String name;
  ContainerDetailList({this.name,this.ontap});


  @override
  _ContainerDetailListState createState() => _ContainerDetailListState();
}

class _ContainerDetailListState extends State<ContainerDetailList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Color(0xffffffff),
        border: Border.all(color: Colors.black38, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListTile(
          onTap: widget.ontap,
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
