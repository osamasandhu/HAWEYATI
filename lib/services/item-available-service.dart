import 'package:haweyati/services/haweyati-service.dart';

abstract class ItemAvailableService<T> extends HaweyatiService<T> {
  Future<List<T>> getAvailable([String city]);
}