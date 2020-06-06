import 'package:flutter/material.dart';
import 'package:haweyati/auth-pages/personalinfo.dart';
import 'package:haweyati/auth-pages/signin.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool autoValidate = false;
  bool loading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  TextEditingController confirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: Form(
        autovalidate: autoValidate,
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Signup",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Please Enter Credentials",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  HaweyatiTextField(
                    label: "Name",
                    controller: name,
                    icon: Icons.person,
                    validator: (value) {
                      return value.isEmpty ? "Please Enter Name" : null;
                    },
                    context: context,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HaweyatiTextField(
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    controller: email,
                    icon: Icons.mail,
                    validator: (value) {
                      return value.isEmpty ? "Please Enter Email" : null;
                    },
                    context: context,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HaweyatiPasswordField(
                    label: "Password",
                    controller: password,
                    validator: (value) {
                      return value.isEmpty ? "Please Enter Password" : null;
                    },
                    context: context,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HaweyatiPasswordField(
                    label: "Confirm Password",
                    controller: confirmPassword,
                    validator: (value) {
                      return value.isEmpty
                          ? "Please Enter Confirm Password"
                          : null;
                    },
                    context: context,
                  ),
                ],
              ),
            ),

            Align(
                alignment: Alignment(0, 0.9),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "Login with Email",
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).accentColor),
                    ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xffff974d),
        tooltip: "Login with Email",
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PersonalInfo()));
          } else {
            setState(() {
              autoValidate = true;
            });
          }
        },
        child: Icon(
          Icons.arrow_forward,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
