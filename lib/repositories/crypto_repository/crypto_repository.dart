import 'dart:convert';

import 'package:dooin/config/urls.dart';
import 'package:dooin/models/crypto_model.dart';
import 'package:dooin/repositories/crypto_repository/base_crypto_repository.dart';
import 'package:http/http.dart' as http;

class CryptoRepository extends BaseCryptoRepository {
  @override
  Future<List<CryptoModel>> getCryptoRates() async {
    Uri uri = Uri.parse(
        'https://api.nomics.com/v1/currencies/ticker?key=955f05521a221ec05d2632d3aea1d742&ids=BTC,ETH,XRP,BCH,ADA,XMR,USDT&interval=1d,30d&convert=RUB&per-page=100&page=1');
    var response = await http.get(uri);

    var currencies = List<CryptoModel>();

    if (response.statusCode == 200) {
      var cryptos = json.decode(response.body);
      for (var crypto in cryptos) {
        currencies.add(CryptoModel.fromJson(crypto));
      }
    }
    return currencies;
  }
}
