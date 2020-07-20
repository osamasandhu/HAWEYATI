import 'package:haweyati/models/available-services_model.dart';
import 'package:haweyati/models/building-material_model.dart';
import 'package:haweyati/models/finishing-material_category.dart';
import 'package:haweyati/services/item-available-service.dart';
import 'package:haweyati/services/haweyati-service.dart';

class FinishingMaterialService extends ItemAvailableService<FinishingMaterial> {
  @override
  FinishingMaterial parse(Map<String, dynamic> item) => FinishingMaterial.fromJson(item);

  Future<List<FinishingMaterial>> getAvailable([String city]) {
    return this.getAll('finishing-material-category');
  }

}