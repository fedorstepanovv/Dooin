part of 'crypto_bloc.dart';

enum CryptoStatus { initial, loading, loaded, error }

class CryptoState extends Equatable {
  final CryptoStatus status;
  final List<CryptoModel> cryptoCurrencies;
  final Failure failure;
  const CryptoState(
      {@required this.cryptoCurrencies,
      @required this.status,
      @required this.failure});

  @override
  List<Object> get props => [status, cryptoCurrencies];
  factory CryptoState.initial() {
    return CryptoState(
      failure: Failure(),
      status: CryptoStatus.initial,
      cryptoCurrencies: [],
    );
  }
 

  CryptoState copyWith({
    CryptoStatus status,
    List<CryptoModel> cryptoCurrencies,
    Failure failure,
  }) {
    return CryptoState(
      status:status ?? this.status,
      cryptoCurrencies:cryptoCurrencies ?? this.cryptoCurrencies,
      failure:failure ?? this.failure,
    );
  }
}
