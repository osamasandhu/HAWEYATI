import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/container-with-subtitle.dart';

class OrderGenerate extends StatefulWidget {
  @override
  _OrderGenerateState createState() => _OrderGenerateState();
}

class _OrderGenerateState extends State<OrderGenerate> {


  List<User> users;
  User selectedUser;
  int selectedRadio;
  int selectedRadioTile;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = User.getUsers();
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }
  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }
  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        RadioListTile(
          value: user,
          groupValue: selectedUser,
          title: Text(user.firstName),
          subtitle: Text(user.lastName),
          onChanged: (currentUser) {
            print("Current User ${currentUser.firstName}");
            setSelectedUser(currentUser);
          },
          selected: selectedUser == user,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),body: ListView(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            width: 100,
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Plastimul",
            textAlign: TextAlign.center,
            style: boldText,
          ),
        ],
      ),

        SizedBox(height: 30,),


      Text("Drum Weight",style: boldText,),

      SizedBox(height: 30,),
Row(children: <Widget>[
  Expanded(
    child: RadioListTile(value: null, groupValue: null, onChanged: null,title: Text("12 gram Drum", style: TextStyle(
      fontSize: 12
    ))),
  ),
  Expanded(
    child: RadioListTile(value: null, groupValue: null, onChanged: null,title: Text("12 gram Drum", style: TextStyle(
      fontSize: 12
    ))),
  )
//
],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
      PlusMinusContainer(
        extra: "Add Extra Days",
        dayprice:" 670.00",
      ),


    ],),
    );
  }
}

class User {
  String firstName;
  String lastName;

  static List<User> getUsers() {
    return [];
  }
}
