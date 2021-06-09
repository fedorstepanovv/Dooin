import 'package:dooin/blocs/currencies/currencies_bloc.dart';
import 'package:dooin/config/color_pallete.dart';
import 'package:dooin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RealCurrencyScreen extends StatelessWidget {
  static const String routeName = '/realScreen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => RealCurrencyScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrenciesBloc, CurrenciesState>(
      listener: (context, state) {
        if(state.status == CurrencyStatus.error) {
          print(state.failure);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                  SliverAppBar(
                    backgroundColor: ColorPallete.backgroundColor,
                    elevation: 0.0,
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    title: Text(
                      "Crypto",
                      style: const TextStyle(
                          fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final price = state.currencies[index].price;
                      final name = state.currencies[index].name;
                      return RealPriceCard(
                        name: name,
                        price: price.toStringAsFixed(3),
     
                      );
                    }, childCount: state.currencies.length),
                  )
              ],
              ),
          ));
      },
    );
  }
}
