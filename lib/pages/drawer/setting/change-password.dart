import 'package:flutter/material.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';
import 'package:haweyati/widgits/stackButton.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  void delay(){

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Row(children: <Widget>[
              SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)
              ),
              SizedBox(width: 20),
              Text('Saving your coordinates ...')
            ]),
          );
        }
    );

    Future.delayed(Duration(seconds: 1),(){
      Navigator.pop(context);
      showAlertDialog(context);
    });



  }



  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = FlatButton(
      child: Text("ok",style: TextStyle(color: Theme.of(context).accentColor),),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm",style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text("Your Password has been change"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  bool autoValidate = false;
  bool loading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController oldPass = new TextEditingController();
  TextEditingController newPass = new TextEditingController();
  TextEditingController confirmPass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: HaweyatiAppBody(
        title: "Change Password",
        detail: loremIpsum.substring(0, 80),

        child: Form(key: _formKey,autovalidate: autoValidate, child: SingleChildScrollView(padding: EdgeInsets.fromLTRB(20, 40, 20, 0), child: Column(
          children: <Widget>[



            HaweyatiPasswordField(
              label: "Old Password",
              controller: oldPass,
              validator: (value) {
                return value.isEmpty ? "Please Enter Old Password" : null;
              },
              context: context,
            ),
SizedBox(height: 15,),
            HaweyatiPasswordField(
              label: "New Password",
              controller:newPass,
              validator: (value) {
                return value.isEmpty ? "Please Enter New Password" : null;
              },
              context: context,
            ),

            SizedBox(height: 15,),
            HaweyatiPasswordField(
              label: "Confirm Password",
              controller:confirmPass,
              validator: (value) {
                return value.isEmpty ? "Please Enter Confirm Password" : null;
              },
              context: context,
            ),
SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: StackButton(buttonName: "Save",
                  onTap: () {
            delay();
            },  ),
            )
          ],

        ),)),

      ),
    );
  }
}
