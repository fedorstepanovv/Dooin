class CurrencyModel {
  Map<String, dynamic> rates;
  CurrencyModel(this.rates);
  CurrencyModel.fromJson(Map<String, dynamic> json) {
    rates = json['rates'];
  }
}
class Rates {
  String name;
  dynamic price;
  Rates(
     this.name,
     this.price,
  );
}
