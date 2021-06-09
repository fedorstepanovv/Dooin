import 'package:dooin/blocs/crypto/crypto_bloc.dart';
import 'package:dooin/repositories/currency_repository/currency_repository.dart';
import 'package:dooin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'config/color_pallete.dart';
import 'config/custom_router.dart';
import 'repositories/repositories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<CryptoRepository>(
          create: (_) => CryptoRepository(),
        ),
        RepositoryProvider<CurrencyRepository>(
          create: (_) => CurrencyRepository(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dooin',
          theme: ThemeData(
            fontFamily: 'SF',
            brightness: Brightness.dark,
            scaffoldBackgroundColor: ColorPallete.backgroundColor,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          onGenerateRoute: CustomRouter.onGenerateRoute,
          initialRoute: NavScreen.routeName),
    );
  }
}
