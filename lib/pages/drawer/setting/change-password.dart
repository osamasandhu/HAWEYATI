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
        btnName: "Done",
        onTap: () {
          Navigator.of(context).pop();
        },
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
              child: StackButton(buttonName: "Change",onTap: (){Navigator.of(context).pop();},),
            )
          ],

        ),)),

      ),
    );
  }
}
