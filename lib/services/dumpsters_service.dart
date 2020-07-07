import 'package:haweyati/models/dumpster_model.dart';
import 'package:haweyati/services/haweyati-service.dart';

class DumpstersService extends HaweyatiService<Dumpsters> {
  @override
  Dumpsters parse(Map<String, dynamic> item) => Dumpsters.fromJson(item);

  Future<List<Dumpsters>> getDumpsters(String city) {
    return this.getAll('dumpsters/available?city=$city');
  }

}