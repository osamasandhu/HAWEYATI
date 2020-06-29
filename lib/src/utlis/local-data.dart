import 'dart:io';
import 'dart:convert';

import 'package:haweyati/models/order-model.dart';
import 'package:path_provider/path_provider.dart';

class LocalData {
  static var currentLng;
  static const _filename = "haweyati-data.json";
  static  List<Order> _cartProducts = [];

  static void addToCart(product) {
    _cartProducts.add(product);
  }

  static void removeFromCart(product) {
    _cartProducts.remove(product);
  }

  static void write() async {
    final dir = (await getApplicationDocumentsDirectory()).path + '/' + _filename;

    try {
      await File(dir).writeAsString(jsonEncode({
        "lng": currentLng,
        "cart": _cartProducts.map((item) => item.toJson()).toList()
      }));
    } catch (e) {
      print("Unable to Parse LocalData file.");
    }
  }

  static void initiate() async {
    final dir = (await getApplicationDocumentsDirectory()).path + '/' + _filename;

    try {
      var data = jsonDecode(await File(dir).readAsString()) as Map<String, dynamic>;
      currentLng = data['lng'] ?? 'English';
      _cartProducts = data['cart']?.map<Order>((item) => Order.fromJson(item))?.toList() ?? [];
    } catch (e) {
      print("Unable to Parse LocalData file.");
    }
  }
}
