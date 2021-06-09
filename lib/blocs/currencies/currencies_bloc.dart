import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dooin/models/currency_model.dart';
import 'package:dooin/models/models.dart';
import 'package:dooin/repositories/currency_repository/currency_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'currencies_event.dart';
part 'currencies_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final CurrencyRepository _currencyRepository;
  List<CurrencyModel> _currencies = List<CurrencyModel>();

  CurrenciesBloc({@required CurrencyRepository currencyRepository})
      : _currencyRepository = currencyRepository,
        super(CurrenciesState.initial());

  @override
  Stream<CurrenciesState> mapEventToState(
    CurrenciesEvent event,
  ) async* {
    if (event is CurrenciesMadeRequest) {
      yield* _mapCryptoMadeRequestToState(event);
    }
  }

  Stream<CurrenciesState> _mapCryptoMadeRequestToState(
      CurrenciesMadeRequest event) async* {
    try {
      yield (state.copyWith(status: CurrencyStatus.loading));
      final currency = await _currencyRepository.getCurrencyRates();
      yield (state.copyWith(
          status: CurrencyStatus.loaded, currencies: currency));
    } catch (e) {
      yield (state.copyWith(
          status: CurrencyStatus.error,
          failure: Failure(message: e.toString())));
    }
  }
}
