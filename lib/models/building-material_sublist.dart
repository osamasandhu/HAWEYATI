import 'bm-pricing.dart';
import 'images_model.dart';
import 'pricing_model.dart';

class BMSubList {
  List<String> suppliers;
  String sId;
  String name;
  String description;
  String parent;
  List<BMPricing> pricing;
  List<Images> images;
  int iV;

  BMSubList(
      {this.suppliers,
        this.sId,
        this.name,
        this.parent,
        this.description,
        this.pricing,
        this.images,
        this.iV});

  BMSubList.fromJson(Map<String, dynamic> json) {
    suppliers = json['suppliers'].cast<String>();
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    parent = json['parent'];
    if (json['pricing'] != null) {
      pricing = List<BMPricing>();
      json['pricing'].forEach((v) {
        pricing.add( BMPricing.fromJson(v));
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
    if (this.pricing != null) {
      data['pricing'] = this.pricing.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}



