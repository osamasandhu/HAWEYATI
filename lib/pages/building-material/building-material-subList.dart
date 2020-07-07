import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/buildingDetrail.dart';
import 'package:haweyati/pages/dumpster/dumpsterDetail.dart';
import 'package:haweyati/pages/dumpster/dumpsterServicesdetail.dart';
import 'package:haweyati/pages/finishing-material/finishing_material_detail.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';
import 'package:haweyati/widgits/list-of-items.dart';

class BuildingMaterialSubList extends StatefulWidget {
  ConstructionService service;
  BuildingMaterialSubList(this.service);
  @override
  _BuildingMaterialSubListState createState() =>
      _BuildingMaterialSubListState();
}

class _BuildingMaterialSubListState extends State<BuildingMaterialSubList> {
  @override
  Widget build(BuildContext context) {
    return

ScrollablePage(

  title: widget.service.title,
  subtitle: loremIpsum.substring(0,90),
  child: SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, i) {
            return           ContainerDetailList(
              imgpath: widget.service.image,
              name: widget.service.title,
              ontap: () {
                print("ds");
                CustomNavigator.navigateTo(
                    context,
                    BuildingDetail(serviceDetail:  widget.service,)
                )
                ;
              },
            );

          },
          childCount: 22
      )

  //SliverList(delegate: SliverChildListDelegate( (context,i){}),),

));

      Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
//          showButton: true,
//          onTap: () {},
//          btnName: "Buy Now",
          title:widget.service.title,
          detail: loremIpsum.substring(0, 90),
          child:
          ListView.builder(

padding: EdgeInsets.symmetric(horizontal: 20),            itemCount: 20,
            itemBuilder: (build, i) {
          return
            ContainerDetailList(
            imgpath: widget.service.image,
            name: widget.service.title,
            ontap: () {
              print("ds");
              CustomNavigator.navigateTo(
                  context,
BuildingDetail(serviceDetail:  widget.service,)
              )
              ;
            },
          );
            },
          )
      ),
    );
  }
}




//
//ContainerDetailList(
//imgpath: widget.service.image,
//name: widget.service.title,
//ontap: () {
//print("ds");
//CustomNavigator.navigateTo(
//context,
//BuildingDetail(serviceDetail:  widget.service,)
//)
//;