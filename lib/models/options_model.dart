class Option {
  String sId;
  String optionName;
  String optionValues;

  Option({this.sId,this.optionValues, this.optionName});

  Option.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    optionName = json['optionName'];
    optionValues = json['optionValues'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['optionName'] = this.optionName;
    data['optionValues'] = this.optionValues;
    return data;
  }

}