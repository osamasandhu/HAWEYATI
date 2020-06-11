import 'package:flutter/material.dart';

import 'package:haweyati/auth-pages/signup.dart';
import 'package:haweyati/src/ui/pages/instructions_page.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
      appBar: HaweyatiAppBar(showAction: true,),
      body: Form(
        autovalidate: autoValidate,
        key: _formKey,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 100),
              child: Column(
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please Enter Credentials",
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  HaweyatiTextField(
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    controller: email,
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
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                        onTap: () {},
                        child: Text("Forget password?",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).accentColor,
                            ))),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment(0, 0.9),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign up with Email",
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).accentColor),
                    ))),
            // Align(alignment: Alignment.bottomCenter,child: Text("ds"),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xffff974d),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => InstructionsPage()));
          } else {
            setState(() {
              autoValidate = true;
            });
          }
        },
        child: Icon(
          Icons.arrow_forward,
          size: 40,          color: Colors.white,
        ),
      ),
    );
  }
}
