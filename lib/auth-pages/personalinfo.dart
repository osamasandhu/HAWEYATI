import 'package:flutter/material.dart';
import 'package:haweyati/auth-pages/signup.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  bool autoValidate = false;
  bool loading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: Form(
        autovalidate: autoValidate,
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Personal Info",
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
                controller: _name,
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
                label: "Email",
                controller: _email,
                icon: Icons.lock,
                validator: (value) {
                  return value.isEmpty ? "Please Enter Email" : null;
                },
                context: context,
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xffff974d),
        onPressed: () {
          if (_formKey.currentState.validate()) {

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
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
