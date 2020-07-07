import 'images_model.dart';

class FinishingMaterial {
  String sId;
  String name;
  String description;
  List<Images> images;
  int iV;

  FinishingMaterial(
      {this.sId, this.name, this.description, this.images, this.iV});

  FinishingMaterial.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}