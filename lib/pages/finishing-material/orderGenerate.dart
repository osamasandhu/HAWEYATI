import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/finishing-material/finishingTimeLocation.dart';
import 'package:haweyati/pages/finishing-material/finishingorderdetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/stackButton.dart';

class OrderGenerate extends StatefulWidget {

  ConstructionService service;
  OrderGenerate(this.service);
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
      appBar: HaweyatiAppBar(context: context,),body: Stack(
        children: <Widget>[

         ListView(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
               image: DecorationImage(image: AssetImage(widget.service.image)),   ),
                width: 100,
                height: 100,
              ),
              SizedBox(
                width: 10,
              ),
              Text(widget.service.title,
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


           EmptyContainer(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Text(
                       "Drop off Location",
                       style: boldText,
                     ),
                     FlatButton.icon(
                         onPressed: (){
                       Navigator.of(context).pop();
                       Navigator.of(context).pop();
                       Navigator.of(context).pop();
                       Navigator.of(context).pop();
                       Navigator.of(context).pop();
                         },
                         icon: Icon(
                           Icons.edit,
                           color: Theme.of(context).accentColor,
                         ),
                         label: Text(
                           "Edit",
                           style:
                           TextStyle(color: Theme.of(context).accentColor),
                         ))
                   ],
                 ),
                 SizedBox(
                   height: 15,
                 ),
                 Row(
                   children: <Widget>[
                     Icon(
                       Icons.location_on,
                       color: Theme.of(context).accentColor,
                     ),
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.only(left: 10),
                         child: Text(loremIpsum.substring(0, 40)),
                       ),
                     )
                   ],
                 ),
               ],
             ),
           ),

    ],),  StackButton(
            buttonName: 'Proceed',
            onTap: (){
              print("afshasjk");
              CustomNavigator.navigateTo(context,
                  FinishingTimeAndLocation(constructionService: widget.service,));
              },
          )
        ],
      ),
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
