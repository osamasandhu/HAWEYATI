import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/widgits/custom-navigator.dart';
import 'package:haweyati/services/dumpsters_service.dart';
import 'package:haweyati/src/ui/widgets/service/list-page.dart';
import 'package:haweyati/src/ui/widgets/service-list-item.dart';

import 'detail_page.dart';

class DumpstersListPage extends ServiceListPage<Dumpster, DumpstersService> {
  DumpstersListPage(): super(
    name: 'Dumpsters',
    service: DumpstersService(),
    builder: (List<Dumpster> dumpsters) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) {
            return ServiceListItem(
              name: dumpsters[i].size,
              image: dumpsters[i].image.name,

              onTap: () {
                CustomNavigator.navigateTo(context, DumpsterDetailPage(dumpsters[i]));
              }
            );
          },
          childCount: dumpsters.length
        )
      );
    }
  );
}
