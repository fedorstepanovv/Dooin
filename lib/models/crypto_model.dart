class CryptoModel {
  String name;
  String price;
  String logo;
  String symbol;
  String logoUrl;
  The1d the1d;
  CryptoModel(this.name, this.price, this.logo, this.the1d,this.symbol,this.logoUrl);

  CryptoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    logo = json['logo_url'];
    the1d = The1d.fromJson(json['1d']);
    symbol = json['symbol'];
    logoUrl = json['logo_url'];
  }
}

class The1d {
  String priceChange;
  The1d(this.priceChange);
  The1d.fromJson(Map<String, dynamic> json) {
    priceChange = json['price_change'];
  }
}
