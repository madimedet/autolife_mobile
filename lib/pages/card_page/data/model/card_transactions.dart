class TransactionsModel {
  String? id;
  String? createdAt;
  String? serviceId;
  String? referenceId;
  String? serviceDescription;
  int? serviceAmount;
  String? currency;
  String? userId;

  TransactionsModel(
      {this.id,
      this.createdAt,
      this.serviceId,
      this.referenceId,
      this.serviceDescription,
      this.serviceAmount,
      this.currency,
      this.userId});

  TransactionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    serviceId = json['serviceId'];
    referenceId = json['referenceId'];
    serviceDescription = json['serviceDescription'];
    serviceAmount = json['serviceAmount'];
    currency = json['currency'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['serviceId'] = this.serviceId;
    data['referenceId'] = this.referenceId;
    data['serviceDescription'] = this.serviceDescription;
    data['serviceAmount'] = this.serviceAmount;
    data['currency'] = this.currency;
    data['userId'] = this.userId;
    return data;
  }
}
