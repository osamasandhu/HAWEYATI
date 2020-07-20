import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haweyati/services/item-available-service.dart';
import 'package:haweyati/src/ui/widgets/live-scrollable_body.dart';
import 'package:haweyati/src/ui/widgets/app-bar.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/simple-future-builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceListPage<T, U extends ItemAvailableService> extends StatefulWidget {
  final U service;
  final String name;
  final Function load;
  final Function builder;

  ServiceListPage({
    this.name,
    this.load,
    this.service,
    this.builder
  });

  @override
  _ServiceListPageState<T> createState() => _ServiceListPageState();
}

class _ServiceListPageState<T> extends State<ServiceListPage> {
  var _flag = false;
  Future<List<T>> _items;

  Future<void> _loadData() async {
    this._items = widget.service.getAvailable(
      (await SharedPreferences.getInstance()).getString('city')
    );

    await _items;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _loadData()..then((value) { this._flag = true; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HaweyatiAppBar(hideHome: true),
      body: LiveScrollableBody(
        onRefresh: _flag ? _loadData : null,
        title: widget.name,
        subtitle: loremIpsum.substring(0, 70),
        child: SimpleFutureBuilder.simplerSliver(
          showLoading: !_flag,
          context: context,
          future: _items,
          builder: (AsyncSnapshot<List<T>> snapshot) {
            if (snapshot.data.length == 0) {
              return SliverToBoxAdapter(child: Text('No Dumpsters service was found in your Area.'));
            } else {
              return widget.builder(snapshot.data);
            }
          },
        ),
      ),
    );
  }
}
