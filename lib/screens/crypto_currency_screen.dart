import 'package:dooin/blocs/blocs.dart';
import 'package:dooin/config/color_pallete.dart';
import 'package:dooin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CryptoCurrencyScreen extends StatefulWidget {
  static const String routeName = '/cryptoScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => CryptoCurrencyScreen());
  }

  @override
  _CryptoCurrencyScreenState createState() => _CryptoCurrencyScreenState();
}

class _CryptoCurrencyScreenState extends State<CryptoCurrencyScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CryptoBloc, CryptoState>(
      listener: (context, state) {
        if (state.status == CryptoStatus.loading) {
          return Center(child: CircularProgressIndicator());
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
                      final price = state.cryptoCurrencies[index].price;
                      final symbol = state.cryptoCurrencies[index].symbol;
                      final priceChange =
                          state.cryptoCurrencies[index].the1d.priceChange;
                      final name = state.cryptoCurrencies[index].name;
                      final url = state.cryptoCurrencies[index].logoUrl;
                      return PriceCard(
                        url: url,
                        name: name,
                        price: price.substring(0,5),
                        priceChange: priceChange,
                        symbol: symbol,
                      );
                    }, childCount: state.cryptoCurrencies.length),
                  )
                ],
              ),
            ));
      },
    );
  }



}
