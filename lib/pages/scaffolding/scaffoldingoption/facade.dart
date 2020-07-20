import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class Facade extends StatefulWidget {
  ConstructionService constructionService;
  Facade({this.constructionService});

  @override
  _FacadeState createState() => _FacadeState();
}

class _FacadeState extends State<Facade> {
  bool autoValidate = false;
  bool loading = false;
  var _formKey = GlobalKey<FormState>();

  TextEditingController length = new TextEditingController();
  TextEditingController faces = new TextEditingController();
  TextEditingController height = new TextEditingController();

  TextEditingController confirmPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(),
      body: HaweyatiAppBody(
        title: "Facade",
        detail: loremIpsum.substring(0, 20),

        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 100),
            child: Column(
              children: <Widget>[
                HaweyatiTextField(
                  keyboardType: TextInputType.number,
                  label: "Length",
                  controller: length,
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Length" : null;
                  },
                  context: context,
                ),
                SizedBox(
                  height: 20,
                ),
                HaweyatiTextField(
                  keyboardType: TextInputType.number,
                  label: "Number of Faces",
                  controller: faces,
                  validator: (value) {
                    return value.isEmpty
                        ? "Please Enter Number of Faces"
                        : null;
                  },
                  context: context,
                ),
                SizedBox(
                  height: 20,
                ),
                HaweyatiTextField(
                  keyboardType: TextInputType.number,
                  label: "Height",
                  controller: height,
                  validator: (value) {
                    return value.isEmpty ? "Please Enter Height" : null;
                  },
                  context: context,
                ),
              ],
            ),
          ),
        ),
        showButton: true,
        onTap: () {
          if (_formKey.currentState.validate()) {
            print("sfssf");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScaffoldingServicesDetail(
                  constructionService:  widget.constructionService,
                )));
          } else {
            setState(() {
              autoValidate = true;
            });
          }
        },
        btnName: tr("Continue"),
      ),
    );
  }
}
