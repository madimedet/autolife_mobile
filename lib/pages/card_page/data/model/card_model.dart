class CardModel {
  String? cardId;
  String? name;
  String? lastNumbersOfCard;
  int? amount;
  int? month;
  int? year;

  CardModel(
      {this.cardId,
      this.name,
      this.lastNumbersOfCard,
      this.amount,
      this.month,
      this.year});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardId: json['cardId'],
      name: json['name'],
      lastNumbersOfCard: json['lastNumbersOfCard'],
      amount: json['amount'],
      month: json['month'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cardId'] = this.cardId;
    data['name'] = this.name;
    data['lastNumbersOfCard'] = this.lastNumbersOfCard;
    data['amount'] = this.amount;
    data['month'] = this.month;
    data['year'] = this.year;
    return data;
  }
}
