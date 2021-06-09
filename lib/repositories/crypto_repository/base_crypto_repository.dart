import 'package:dooin/models/models.dart';

abstract class BaseCryptoRepository {
  Future<List<CryptoModel>> getCryptoRates();
}