import 'images_model.dart';
import 'pricing_model.dart';

class Dumpsters {
  List<String> suppliers;
  String sId;
  String size;
  String description;
  List<Pricing> pricing;
  List<Images> images;
  int iV;

  Dumpsters(
      {this.suppliers,
        this.sId,
        this.size,
        this.description,
        this.pricing,
        this.images,
        this.iV});

  Dumpsters.fromJson(Map<String, dynamic> json) {
    suppliers = json['suppliers'].cast<String>();
    sId = json['_id'];
    size = json['size'];
    description = json['description'];
    if (json['pricing'] != null) {
      pricing = List<Pricing>();
      json['pricing'].forEach((v) {
        pricing.add( Pricing.fromJson(v));
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
    data['size'] = this.size;
    data['description'] = this.description;
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



