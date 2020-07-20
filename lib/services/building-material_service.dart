import 'package:haweyati/models/building-material_model.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/services/item-available-service.dart';

class BuildingMaterialService extends ItemAvailableService<BuildingMaterials> {
  @override
  BuildingMaterials parse(Map<String, dynamic> item) => BuildingMaterials.fromJson(item);

  @override
  Future<List<BuildingMaterials>> getAvailable([String city]) {
    return this.getAll('building-material-category');
  }
}