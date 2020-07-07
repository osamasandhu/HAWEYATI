import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haweyati/models/available-services_model.dart';
import 'package:haweyati/services/haweyati-service.dart';
import 'package:haweyati/src/utlis/const.dart';

class ServiceAvailability extends HaweyatiService<AvailableServices> {
  @override
    AvailableServices parse(Map<String, dynamic> item) => AvailableServices.fromJson(item);


  Future<AvailableServices> getAvailableServices(LatLng cords) async {
    return this.getOne('suppliers/available?lat=${cords.latitude}&lng=${cords.longitude}');
  }

}