import 'package:flutter/material.dart';
import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/src/ui/widgets/app-bar.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import '../../../../../pages/dumpster/dumpsterServicesdetail.dart';

class DumpsterDetailPage extends StatelessWidget {
  final Dumpster dumpster;

  DumpsterDetailPage(this.dumpster)
      : assert(dumpster != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(progress: .4),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 250,
            child: Image.network(
                  HaweyatiService.resolveImage(dumpster.image.name),
                  height: 250,
                )),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(dumpster.size + ' Dumpster', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RichText(text: TextSpan(
              text: dumpster.pricing[0].rent.toStringAsFixed(2),
              children: [TextSpan(text: ' SAR', style: TextStyle(fontStyle: FontStyle.italic))]
            )),
//              Text(dumpster.pricing[0].rent.toStringAsFixed(2) + ' SAR'),
//              SizedBox(width: 10),
//              Text(
//                '',
//                widget.serviceDetail.detail.days,
//                style: TextStyle(color: Colors.black54),
//              )
//            ], mainAxisAlignment: MainAxisAlignment.start),
          ),
          SizedBox(height: 20),
//          Text(widget.serviceDetail.detail.description),
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: SizedBox(
          height: 45,
          child: FlatButton(
            child: Text("Rent Now", style: TextStyle(fontWeight: FontWeight.bold)),
            onPressed: () {
              CustomNavigator.navigateTo(context, DumpsterServicesDetail(dumpsters: dumpster,));
            },
            textColor: Colors.white,
            disabledColor: Colors.grey.shade400,
            color: Theme.of(context).accentColor,
            shape: StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
