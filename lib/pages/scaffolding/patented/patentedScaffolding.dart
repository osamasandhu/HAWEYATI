import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingoption/ceiling.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingoption/facade.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class PatentedOptions extends StatelessWidget {
  ConstructionService constructionService;
  PatentedOptions({this.constructionService});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HaweyatiAppBar(
          context: context,
        ),
        body: HaweyatiAppBody(
          title: "Scaffolding Options",
          detail: loremIpsum.substring(0, 66),
          child: ListView(padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            children: <Widget>[

              EmptyContainer(child: ListTile(onTap: (){CustomNavigator.navigateTo(context, Facade(constructionService: constructionService,));}, title: Text("Facade"),trailing: Icon(Icons.arrow_forward_ios),),)
              ,             EmptyContainer( child: ListTile( onTap: (){CustomNavigator.navigateTo(context, ScaffoldingServicesDetail(constructionService: constructionService,));},title: Text("Manual"),trailing: Icon(Icons.arrow_forward_ios),),)
              ,           ],
          ),
        ));
  }
}
