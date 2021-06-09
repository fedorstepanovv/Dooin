import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dooin/models/models.dart';
import 'package:dooin/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final CryptoRepository _cryptoRepository;
  List<CryptoModel> _currencies = List<CryptoModel>();

  CryptoBloc({@required CryptoRepository cryptoRepository})
      : _cryptoRepository = cryptoRepository,
        super(CryptoState.initial());

  @override
  Stream<CryptoState> mapEventToState(
    CryptoEvent event,
  ) async* {
    if (event is CryproMadeRequest) {
     yield* _mapCryptoMadeRequestToState(event);
    }
  }

  Stream<CryptoState> _mapCryptoMadeRequestToState(
      CryproMadeRequest event) async* {
    try {
      yield (state.copyWith(status: CryptoStatus.loading));
      final crypto = await _cryptoRepository.getCryptoRates();
      _currencies.addAll(crypto);
      for(var i in crypto){
        _currencies.add(i);
      }
      yield (state.copyWith(
          status: CryptoStatus.loaded, cryptoCurrencies: _currencies));
    } catch (e) {
      yield (state.copyWith(
          status: CryptoStatus.error,
          failure: Failure(message: "Oopss. Some crypto probleemss...")));
    }
  }
}
