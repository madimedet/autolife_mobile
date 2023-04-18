class AccommodationsModel {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;

  AccommodationsModel({this.id, this.createdAt, this.updatedAt, this.name});

  AccommodationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['name'] = this.name;
    return data;
  }
}
