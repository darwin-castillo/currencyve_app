class CurrencyModel {
  int? id;
  String? name;
  String? symbol;
  double? value;
  String? abrev;
  String? date;
  String? image;

  CurrencyModel(
      {this.id,
      this.name,
      this.symbol,
      this.abrev,
      this.image,
      this.value,
      this.date});

  CurrencyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['title'];
    symbol = json['symbol'];
    value = json['price'];
    date = json['last_update'];
  }
  Map toMap() {
    return {
      'id':id,
      'title':name,
      'symbol':symbol,
      'price':value,
      'last_update':date
    };
  }
}
