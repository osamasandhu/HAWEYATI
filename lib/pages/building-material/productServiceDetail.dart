import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/models/temp-model.dart';
import 'package:haweyati/pages/building-material/buildingTimeLocation.dart';
import 'package:haweyati/src/ui/widgets/scrollable_page.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/widgits/appBar.dart';
import 'package:haweyati/widgits/container-with-add-remove-item.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/widgits/haweyati-appbody.dart';

class BuildingProductDetail extends StatefulWidget {
  ConstructionService service;
  BuildingProductDetail(this.service);
  @override
  _BuildingProductDetailState createState() => _BuildingProductDetailState();
}

class _BuildingProductDetailState extends State<BuildingProductDetail> {
  @override
  Widget build(BuildContext context) {
    return
      ScrollablePage(title: "Product Detail",subtitle: loremIpsum.substring(0,65),action: tr("Continue"),showButtonBackground: true,

        onAction:
            (){CustomNavigator.navigateTo(context,
            BuildingTimeAndLocation(constructionService: widget.service,));},



        child: SliverList(delegate: SliverChildListDelegate([
        Align(alignment: Alignment.centerLeft,
            child:   RichText(text: TextSpan(text: "Small Container,",style: TextStyle(color: Colors.black,fontSize: 16,  fontWeight: FontWeight.bold),children: [



              TextSpan(text: "     12 Yard",style: TextStyle(fontSize: 12, ))

            ]),)
        ),SizedBox(height: 10,),

        PlusMinusContainer(
          extra: "Quantity",
          dayprice: "${widget.service.detail.rate}",
        ),

        SizedBox(height: 20,),
        Align(alignment: Alignment.centerLeft,
            child:   RichText(text: TextSpan(text: "Big Container,",style: TextStyle(color: Colors.black,fontSize: 16,  fontWeight: FontWeight.bold),children: [



              TextSpan(text: "     20 Yard",style: TextStyle(fontSize: 12, ))

            ]),)
        ),SizedBox(height: 10,),

        PlusMinusContainer(
          extra: "Quantity",
          dayprice: "${widget.service.detail.rate}",
        )





      ])),);


      Scaffold(
      appBar: HaweyatiAppBar(context: context,),
      body: HaweyatiAppBody(
        title: "Product Detail",
        detail: loremIpsum.substring(0, 90),
        child: ListView(

          children: <Widget>[


            Align(alignment: Alignment.centerLeft,
  child:   RichText(text: TextSpan(text: "Small Container,",style: TextStyle(color: Colors.black,fontSize: 16,  fontWeight: FontWeight.bold),children: [



    TextSpan(text: "     12 Yard",style: TextStyle(fontSize: 12, ))

  ]),)
),SizedBox(height: 10,),

            PlusMinusContainer(
              extra: "Quantity",
              dayprice: "${widget.service.detail.rate}",
            ),

SizedBox(height: 20,),
            Align(alignment: Alignment.centerLeft,
                child:   RichText(text: TextSpan(text: "Big Container,",style: TextStyle(color: Colors.black,fontSize: 16,  fontWeight: FontWeight.bold),children: [



                  TextSpan(text: "     20 Yard",style: TextStyle(fontSize: 12, ))

                ]),)
            ),SizedBox(height: 10,),

            PlusMinusContainer(
              extra: "Quantity",
              dayprice: "${widget.service.detail.rate}",
            )




          ],
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        )

        ,btnName: tr("Continue"),onTap:


          (){CustomNavigator.navigateTo(context,
          BuildingTimeAndLocation(constructionService: widget.service,));},


        showButton: true,
      ),
    );
  }
}
