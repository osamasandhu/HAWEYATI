import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/services/item-available-service.dart';

class DumpstersService extends ItemAvailableService<Dumpster> {
  @override
  Dumpster parse(Map<String, dynamic> item) => Dumpster.fromJson(item);

  Future<List<Dumpster>> getAvailable([String city]) {
    return this.getAll('dumpsters/available?city=$city');
  }

}