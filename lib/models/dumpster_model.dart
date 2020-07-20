import 'image_model.dart';
import 'rent_model.dart';

class Dumpster {
  String id;
  String size;
  String description;

  List<Rent> pricing;
  List<String> suppliers;
  ImageData image;

  Dumpster({
    this.id,
    this.size,
    this.image,
    this.pricing,
    this.suppliers,
    this.description
  });

  Dumpster.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    size = json['size'];
    suppliers = json['suppliers'].cast<String>();
    description = json['description'];
    image =  ImageData.fromJson(json['image']);
    pricing = (json['pricing'] as List)?.map((rent) => Rent.fromJson(rent))?.toList();
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "size": size,
    "suppliers": suppliers,
    "description": description,
    "images": image.toJson(),
    "pricing": pricing.map((e) => e.toJson()).toList()
  };
}