import 'package:flutter/material.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/services/bm-sublist_service.dart';
import 'package:haweyati/src/ui/widgets/service-list-item.dart';
import 'package:haweyati/models/building-material_sublist.dart';
import 'package:haweyati/src/ui/widgets/service/sub-list-page.dart';
import 'package:haweyati/pages/building-material/buildingDetrail.dart';

class BuildingMaterialSubListPage extends ServiceSubListPage<BMSubList, BMSublistService> {
  BuildingMaterialSubListPage({String id}): super(
    builder: (List<BMSubList> data) {
      return SliverList(delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container();
//          return ServiceListItem(
//            name: data[index].name,
//            image: data[index].images[0].name,
//            onTap: () => CustomNavigator.navigateTo(context, BuildingDetail(item: data[index]))
//          );
        },
        childCount: data.length
      ));
    },
    service: BMSublistService(id)
  );
}

//class BuildingMaterialSubList extends StatefulWidget {
//  final BuildingMaterials buildingMaterials;
//  BuildingMaterialSubList({this.buildingMaterials});
//  @override
//  _BuildingMaterialSubListState createState() =>
//      _BuildingMaterialSubListState();
//}
//
//class _BuildingMaterialSubListState extends State<BuildingMaterialSubList> {
//
//  Future<List<BMSubList>> bmSublist;
//  var _service = BMSublistService();
//
//
//  @override
//  void initState() {
//    super.initState();
//    bmSublist =_service.getBMSublist(widget.buildingMaterials.sId);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: HaweyatiAppBar(context: context,),
//      body: HaweyatiAppBody(
////          showButton: true,
////          onTap: () {},
////          btnName: "Buy Now",
//          child: SimpleFutureBuilder.simpler(
//            future: bmSublist,
//            context: context,
//            builder: (AsyncSnapshot<List<BMSubList>> snapshot){
//              return ListView.builder(
//                padding: EdgeInsets.symmetric(horizontal: 20),
//                itemCount: snapshot.data.length,
//                itemBuilder: (context,i){
//                  var bmSubList = snapshot.data[i];
//                  return ServiceListItem(
//                    name:bmSubList.name,
//                    image: bmSubList.images[0].name,
//                      onTap: (){
//                        CustomNavigator.navigateTo(context, BuildingDetail(item: bmSubList,));
//                      }
//                  );
//
//                    ContainerDetailList(
//                      name: bmSubList.name,
//                      imgpath: bmSubList.images[0].name,
//                      ontap: (){
//                        CustomNavigator.navigateTo(context, BuildingDetail(item: bmSubList,));
//                      }) ;
//                },
//              );
//            },
//          )
//      ),
//    );
//  }
//}
