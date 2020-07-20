import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:haweyati/src/ui/widgets/app-bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:haweyati/services/item-available-service.dart';
import 'package:haweyati/src/utlis/simple-future-builder.dart';

class ServiceSubListPage<T, U extends ItemAvailableService> extends StatefulWidget {
  final U service;
  final String name;
  final Function builder;

  ServiceSubListPage({
    this.name,
    this.service,
    this.builder
  });

  @override
  _ServiceSubListPageState<T> createState() => _ServiceSubListPageState();
}

class _ServiceSubListPageState<T> extends State<ServiceSubListPage> {
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Text('asd'))
//          SimpleFutureBuilder.simplerSliver(
//            showLoading: !_flag,
//            context: context,
//            future: _items,
//            builder: (AsyncSnapshot<List<T>> snapshot) {
//              if (snapshot.data.length == 0) {
//                return SliverToBoxAdapter(child: Text('No Dumpsters service was found in your Area.'));
//              } else {
//                return widget.builder(snapshot.data);
//              }
//            },
//          ),
        ]
      ),
    );
  }
}
