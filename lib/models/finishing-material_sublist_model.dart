import 'package:haweyati/models/options_model.dart';
import 'package:haweyati/models/varient_model.dart';
import 'images_model.dart';

class FinSubList {
  List<String> suppliers;
  String sId;
  double price;
  String name;
  String description;
  String parent;
  List<Option> options;
  List<Variant> variants;
  List<Images> images;
  int iV;

  FinSubList(
      {this.suppliers,
        this.sId,
        this.price,
        this.name,
        this.variants,
        this.parent,
        this.description,
        this.options,
        this.images,
        this.iV});

  FinSubList.fromJson(Map<String, dynamic> json) {
    suppliers = json['suppliers'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    parent = json['parent'];
    if (json['options'] != null) {
      options = List<Option>();
      json['options'].forEach((v) {
        options.add( Option.fromJson(v));
      });
    }
    if (json['varient'] != null) {
      variants = List<Variant>();
      json['varient'].forEach((v) {
        variants.add( Variant.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suppliers'] = this.suppliers;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['parent'] = this.parent;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }
    if (this.variants != null) {
      data['varient'] = this.options.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}



