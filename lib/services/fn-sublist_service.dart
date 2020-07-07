import 'package:haweyati/models/finishing-material_sublist_model.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FINSublistService extends HaweyatiService<FinSubList> {
  @override
  FinSubList parse(Map<String, dynamic> item) => FinSubList.fromJson(item);

  Future<List<FinSubList>> getFinSublist(String parentId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String city = prefs.getString('city');
    return this.getAll('finishing-materials?city=$city&parent=$parentId');
  }

}