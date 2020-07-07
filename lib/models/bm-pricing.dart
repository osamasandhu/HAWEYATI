class BMPricing {
  String city;
  double price;
  String sId;
  BMPricing({this.price, this.city});

  BMPricing.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    price = double.parse(json['price'].toString());
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['price'] = this.price;
    data['_id'] = this.sId;
    return data;
  }
}
