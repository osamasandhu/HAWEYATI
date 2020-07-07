import 'package:haweyati/models/building-material_model.dart';
import 'package:haweyati/services/haweyati-service.dart';

class BuildingMaterialService extends HaweyatiService<BuildingMaterials> {
  @override
  BuildingMaterials parse(Map<String, dynamic> item) => BuildingMaterials.fromJson(item);

  Future<List<BuildingMaterials>> getBuildingMaterials() {
    return this.getAll('building-material-category');
  }

}