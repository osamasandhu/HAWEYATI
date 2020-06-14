import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpstermodel.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/phoneNumber.dart';
import 'package:haweyati/src/app.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/haweyati_Textfield.dart';

class VisaCard extends StatefulWidget {
  ConstructionService constructionService;
  VisaCard({this.constructionService});
  @override
  _VisaCardState createState() => _VisaCardState();
}

class _VisaCardState extends State<VisaCard> {
  TextEditingController name;
  TextEditingController card;

  bool autoValidate = false;
  bool loading = false;
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
          onTap: () {print(widget.constructionService);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhoneNumber(constructionService: widget.constructionService,)));
            },
          title: "Visa Card",
          detail: "Card Payment Visa",
          showButton: true,
          btnName: " Pay ${widget.constructionService.detail.rate}",
          child: Form(
              autovalidate: autoValidate,
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  15,
                  30,
                  15,
                  100,
                ),
                child: Column(
                  children: <Widget>[
                    HaweyatiTextField(
                      label: "Name",
                      context: context,
                      controller: name,
                      validator: (value) {
                        return value.isEmpty ? "Please Enter Name" : null;
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    HaweyatiTextField(
                      label: "Card Number",
                      context: context,
                      controller: name,
                      validator: (value) {
                        return value.isEmpty
                            ? "Please Enter Card Number"
                            : null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child:  TextFormField(
                            scrollPadding: EdgeInsets.all(180),
                            decoration: InputDecoration(
                                labelText: "Expire Date",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 5)),
                                suffix: InkWell(
                                  child: Icon(Icons.calendar_today,size: 15,),
                                )),
                            validator: (value) {
                              return value.isEmpty
                                  ? "Please Enter Card Number"
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: TextFormField(
                            scrollPadding: EdgeInsets.all(180),
                            decoration: InputDecoration(
                                labelText: "Security Code",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 5)),
                            ),
                            validator: (value) {
                              return value.isEmpty
                                  ? "Please Enter Security Code"
                                  : null;
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
