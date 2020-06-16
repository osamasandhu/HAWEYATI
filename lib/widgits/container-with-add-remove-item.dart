
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlusMinusContainer extends StatefulWidget {


  String extra;
  String dayprice;
  Function(int) onValueChange;



  PlusMinusContainer({this.dayprice,this.extra, this.onValueChange});

  @override
  _PlusMinusContainerState createState() => _PlusMinusContainerState();
}

class _PlusMinusContainerState extends State<PlusMinusContainer> {

  int quantity = 0;

  _increment(){

 setState(() {
   quantity++;
 });
 widget.onValueChange(quantity);

  }
  _decrement(){


    setState(() {
      quantity--;
    });
    widget.onValueChange(quantity);
  }

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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
                Text(
              widget.extra,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),Text(
              widget.dayprice,
              style: TextStyle(
                   fontSize: 16),
            ),],

            ),
          ),

Row(children: <Widget>[



  Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
      color: Theme.of(context).accentColor,  borderRadius:
    BorderRadius
        .circular(25),),
    child: IconButton(padding: EdgeInsets.zero,
      icon:
      Icon(Icons.remove,color: Colors.white,),
      onPressed: () {


      if(quantity>0){
        _decrement();

      }
      },
    ),
  )
  ,
  Padding(
    padding: const EdgeInsets
        .symmetric(
        horizontal: 10),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white,),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        child: Text(
          "$quantity",             style: TextStyle(
            fontSize: 12,color: Colors.black),
        ),
      ),
    ),
  ),
  Container(
    width: 30,
    height: 30,
    decoration: BoxDecoration(
        borderRadius:
        BorderRadius
            .circular(25),
        color: Theme.of(context).accentColor),
    child: IconButton(padding: EdgeInsets.zero,
      icon:
      Icon(Icons.add,color: Colors.white,),
      onPressed: () {

        _increment();

      },
    ),
  )
  ,
],)


        ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
      ),
    );
  }
}



//IconButton(
//icon:
//Icon(Icons.remove),
//onPressed: () {
//},
//),
