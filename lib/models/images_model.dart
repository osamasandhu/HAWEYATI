class Images {
  String sId;
  String path;
  String name;

  Images({this.sId, this.path});

  Images.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    path = json['path'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['path'] = this.path;
    return data;
  }
}