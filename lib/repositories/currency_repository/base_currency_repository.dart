import 'package:dooin/models/currency_model.dart';

abstract class BaseCurrencyRepository {
  Future<List<Rates>> getCurrencyRates();
}
