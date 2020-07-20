import 'package:haweyati/models/building-material_model.dart';
import 'package:haweyati/models/building-material_sublist.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/services/item-available-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BMSublistService extends ItemAvailableService<BMSubList> {
  final String id;
  BMSublistService(this.id);

  @override
  BMSubList parse(Map<String, dynamic> item) => BMSubList.fromJson(item);

  @override
  Future<List<BMSubList>> getAvailable([String city]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String city = prefs.getString('city');
    return this.getAll('building-materials?city=$city&parent=$id');
  }
}