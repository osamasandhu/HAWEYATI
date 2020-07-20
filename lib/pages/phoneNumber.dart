import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/auth-pages/signup.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/verification.dart';
import 'package:haweyati/services/auth-service.dart';
import 'package:haweyati/src/utlis/validators.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class PhoneNumber extends StatefulWidget {
  final ConstructionService constructionService;
  PhoneNumber({this.constructionService});
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool autoValidate = false;
  var key = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HaweyatiAppBar(context: context,),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(key.currentState.validate()){
              CustomNavigator.navigateTo(context, VerificationPhoneNumber(phoneNumber: phone.text,));
            }else{
              setState(() {
                autoValidate=true;
              });
            }
           },
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: Stack(fit: StackFit.expand,
          children: <Widget>[


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
            Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Hello",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  child: Text(
                    "Enter Your Phone Number in International Format to Login",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: key,
                  autovalidate: autoValidate,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 30, 15, 100),
                    child: HaweyatiTextField(

                      validator: (value)=> phoneValidator(value),
                      controller: phone,label: "Phone Number",
                      context: context,keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
