import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownContainer extends StatefulWidget {
  String extra;
  String dayprice;
  Function(int) onValueChange;

  DropDownContainer({this.dayprice, this.extra, this.onValueChange});

  @override
  _DropDownContainerState createState() => _DropDownContainerState();
}

class _DropDownContainerState extends State<DropDownContainer> {
  int quantity = 0;
 static List<String> sizeList =<String>[

    "1 Meter", "1.5 Meter", "2 Meter","2.5 Meter", "3 Meter", "3.5 Meter","4 Meter"
  ];
  String selection = sizeList[0];


  _increment() {
    setState(() {
      quantity++;
    });
    widget.onValueChange(quantity);
  }

  _decrement() {
    setState(() {
      quantity--;
    });
    widget.onValueChange(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2f2),
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    widget.extra,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (quantity > 0) {
                              _decrement();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              "$quantity",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).accentColor),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _increment();
                          },
                        ),
                      ),
                    ],
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),


         SizedBox(height: 10,),     Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.dayprice),


                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: DropdownButton<String>(
                      underline: SizedBox(),

                      value: selection,
                      items: sizeList
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value,),
                        );
                      }).toList(),
                      onChanged: (_) {setState(() {
                        selection=_;
                      });

                      },
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
