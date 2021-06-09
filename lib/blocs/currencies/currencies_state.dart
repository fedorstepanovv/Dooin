part of 'currencies_bloc.dart';

enum CurrencyStatus { initial, loading, loaded, error }

class CurrenciesState extends Equatable {
  final CurrencyStatus status;
  final List<Rates> currencies;
  final Failure failure;
  const CurrenciesState(
      {@required this.status,
      @required this.currencies,
      @required this.failure});

  @override
  List<Object> get props => [status, currencies, failure];
  factory CurrenciesState.initial() {
    return CurrenciesState(
      status: CurrencyStatus.initial,
      currencies: [],
      failure: Failure(),
    );
  }

  CurrenciesState copyWith({
    CurrencyStatus status,
    List<Rates> currencies,
    Failure failure,
  }) {
    return CurrenciesState(
      status: status ?? this.status,
      currencies: currencies ?? this.currencies,
      failure: failure ?? this.failure,
    );
  }
}
