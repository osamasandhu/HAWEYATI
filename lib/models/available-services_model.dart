class AvailableServices {
  List<String> services;
  String city;

  AvailableServices({this.services, this.city});

  AvailableServices.fromJson(Map<String, dynamic> json) {
    services = json['services'].cast<String>();
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['services'] = this.services;
    data['city'] = this.city;
    return data;
  }
}