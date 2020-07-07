import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingoption/ceiling.dart';
import 'package:haweyati/pages/scaffolding/scaffoldingoption/facade.dart';
import 'package:haweyati/pages/scaffolding/scaffoldinserviceDetail.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/emptyContainer.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class ScaffoldingOptions extends StatelessWidget {
  ConstructionService constructionService;
  ScaffoldingOptions({this.constructionService});
  @override
  Widget build(BuildContext context) {
    return ScrollablePage(

      title: "Scaffolding Option",
      subtitle: loremIpsum.substring(0,120),
      child: SliverList(delegate: SliverChildListDelegate([
      EmptyContainer(child: ListTile(onTap: (){CustomNavigator.navigateTo(context, Facade(constructionService: constructionService,));}, title: Text("Facade"),trailing: Icon(Icons.arrow_forward_ios),),)
      ,             EmptyContainer(child: ListTile(onTap: (){CustomNavigator.navigateTo(context, Ceiling(constructionService: constructionService,));} ,title: Text("Ceiling"),trailing: Icon(Icons.arrow_forward_ios),),)
      ,             EmptyContainer( child: ListTile( onTap: (){CustomNavigator.navigateTo(context, ScaffoldingServicesDetail(constructionService: constructionService,));},title: Text("Manual"),trailing: Icon(Icons.arrow_forward_ios),),)
      ,

    ])),);
  }
}
