class BmiBean {
  String? id;
  String? date;
  String? label;
  String? bmiValue;
  String? height;
  String? kg;

  BmiBean({this.id, this.date, this.label, this.bmiValue, this.height, this.kg});

  BmiBean.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    label = json['label'];
    bmiValue = json['bmiValue'];
    height = json['height'];
    kg = json['kg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['label'] = this.label;
    data['bmiValue'] = this.bmiValue;
    data['height'] = this.height;
    data['kg'] = this.kg;
    return data;
  }
}
