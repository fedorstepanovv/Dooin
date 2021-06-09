import 'dart:convert';

import 'package:dooin/config/urls.dart';
import 'package:http/http.dart' as http;
import 'package:dooin/models/currency_model.dart';

import 'base_currency_repository.dart';

class CurrencyRepository extends BaseCurrencyRepository {
  @override
  Future<List<Rates>> getCurrencyRates() async {
    Uri uri = Uri.parse(Urls.currencyUrl);
    List<Rates> ratesList;
    var response = await http.get(uri);
    // var currencies = List<CurrencyModel>();

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      var rates = CurrencyModel.fromJson(data);
      ratesList =
          rates.rates.entries.map((e) => Rates(e.key, e.value)).toList();
    }
    return ratesList;
  }
}
