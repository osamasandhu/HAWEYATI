
class Order {
  int id;
  int status;
  String name;
  String price;
  int quantity;
  double total;
  double deliveryFee;
  String image;
  String dropOffDate;
  String dropOffTime;
  String pricePerDay;
  String location;
  String note;
  String serviceDays;

  Order(
      {this.id,
        this.note,
      this.name,
      this.price,
        this.location,
        this.serviceDays,
      this.status,
      this.quantity,
      this.total,
      this.deliveryFee,
      this.image,
      this.dropOffDate,
      this.dropOffTime,
      this.pricePerDay});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['status'] = this.status;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['delivery_fee'] = this.deliveryFee;
    data['image'] = this.image;
    data['drop_off_date'] = this.dropOffDate;
    data['drop_off_time'] = this.dropOffTime;
    data['location'] = this.location;
    data['service_days'] = this.serviceDays;
    data['note'] = this.note;
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      status: json['status'],
      quantity: json['quantity'],
      total: json['total'],
      deliveryFee: json['delivery_fee'],
      image: json['image'],
      dropOffDate: json['drop_off_date'],
      dropOffTime: json['drop_off_time'],
      location: json['location'],
      serviceDays: json['service_days'],
      note: json['note'],
    );
  }
}
