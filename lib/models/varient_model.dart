class Variant {
  String variant1;
  String variant2;
  String variant3;
  String price;

  Variant({this.variant1, this.variant2,this.variant3,this.price});

  Variant.fromJson(Map<String, dynamic> json) {
    variant1 = json.keys.elementAt(0);
    variant2 = json.keys.elementAt(1);
    variant3 = json.keys.elementAt(2);
    price = json.keys.elementAt(json.keys.length-1);
  }

}