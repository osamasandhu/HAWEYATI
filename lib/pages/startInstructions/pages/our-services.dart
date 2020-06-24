import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/widgits/align.dart';
import 'package:haweyati/widgits/instructionpagewidgit.dart';


class OurServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Stack(
              children: <Widget>[

              ],
            )),

        DetailofPage(title: tr('Our Services'),)
      ],
    );
  }
}
