import 'package:dooin/screens/screens.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => Scaffold(),
            settings: const RouteSettings(name: '/'));
      case NavScreen.routeName:
        return NavScreen.route();
      case RealCurrencyScreen.routeName:
        return RealCurrencyScreen.route();
      case CryptoCurrencyScreen.routeName:
        return CryptoCurrencyScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route onGenerateNestedRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case RealCurrencyScreen.routeName:
        return RealCurrencyScreen.route();
      case CryptoCurrencyScreen.routeName:
        return CryptoCurrencyScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: '/error',
      ),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("Our Fault"),
        ),
        body: Center(child: Text('Oopss...Sorry, but something went wrong')),
      ),
    );
  }
}
