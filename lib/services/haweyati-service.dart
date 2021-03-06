import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:haweyati/src/utlis/const.dart';
import 'package:haweyati/src/utlis/local-data.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

abstract class HaweyatiService<T> {

  Dio dio = Dio();


  Future<List<T>> getAll(String route) async {
//    print(route);
    print("$apiUrl/$route");
    final response = await http.get('$apiUrl/$route',headers: {
      'Accept': 'application/json',
    },
    );

    switch(response.statusCode){
      case 200:
        final decodedData = await compute<String, List<Map<String, dynamic>>>(_decodeData, response.body);
        return decodedData.map<T>((item) => parse(item)).toList();
        break;
      case 401:
        var responseData = json.decode(response.body);
        print(responseData);
        break;
      case 404:
        throw Exception("404 error Error while fetching Data. from $apiUrl");
        break;
      case 405:
        throw Exception("405 error Error while fetching Data. from $apiUrl");
        break;
      case 422:
        throw Exception("422 error Error while fetching Data. from $apiUrl");
        break;
      case 500:
        throw Exception("${response.body} 500 error Error while fetching Data. from $apiUrl");
        break;
      default:
    }
//    if (response.statusCode == 200) {
//      final decodedData = await compute<String, List<Map<String, dynamic>>>(_decodeData, response.body);
//
//      return decodedData.map<T>((item) => parse(item)).toList();
//    } else {
//      throw Exception("Error while fetching Data. from $apiUrl");
//    }
  }
//
  static List<Map<String, dynamic>> _decodeData(String encodedData) {
    return jsonDecode(encodedData).cast<Map<String, dynamic>>();
  }

  static resolveImage(String url) {
    return "$apiUrl/uploads/$url";
  }

  T parse(Map<String, dynamic> item);

  static post(String route, data) async {
    Dio dio =  Dio();

    try {
      print('$apiUrl/$route');
      Response response = await dio.post("$apiUrl/$route", data: data,options: Options(

      ));
      print(response.data);
      return response;
    }
    on DioError catch(e) {
//      return e;


      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response.data);
        print(e.response.headers);
        print(e.response.request);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.request);
        print(e.message);
      }
    }
  }

  static convertImgUrl(String url){
    return "$apiUrl/uploads/$url";
  }


  Future<T> getOne(String route) async {
    print("$apiUrl/$route");
    final response = await dio.get('$apiUrl/$route'
    );

    switch(response.statusCode){
      case 200:
        return parse(response.data);
        break;
      case 401:
        var responseData = json.decode(response.data);
        print(responseData);
        break;
      case 404:
        throw Exception("404 error Error while fetching Data. from $apiUrl");
        break;
      case 405:
        throw Exception("405 error Error while fetching Data. from $apiUrl");
        break;
      case 422:
        throw Exception("422 error Error while fetching Data. from $apiUrl");
        break;
      case 500:
        throw Exception("${response} 500 error Error while fetching Data. from $apiUrl");
        break;
      default:
    }
  }

}
