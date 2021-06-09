import 'package:dooin/enums/bottom_nav_item.dart';
import 'package:dooin/nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:dooin/nav/widgets/widgets.dart';
import 'package:dooin/screens/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavScreen extends StatelessWidget {
  static const String routeName = '/nav';

  static Route route() {
    return PageRouteBuilder(
      settings: const RouteSettings(name: routeName),
      transitionDuration: const Duration(seconds: 0),
      pageBuilder: (_, __, ___) => BlocProvider<BottomNavBarCubit>(
        create: (_) => BottomNavBarCubit(),
        child: NavScreen(),
      ),
    );
  }

  final Map<BottomNavItem, GlobalKey<NavigatorState>> navigatorKeys = {
    BottomNavItem.crypto: GlobalKey<NavigatorState>(),
    BottomNavItem.real: GlobalKey<NavigatorState>(),
  };

  final Map<BottomNavItem, IconData> items = const {
    BottomNavItem.crypto: Icons.account_balance_wallet_outlined,
    BottomNavItem.real: Icons.account_balance_outlined ,
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: items
                  .map((item, _) => MapEntry(
                        item,
                        _buildOffstageNavigator(
                          item,
                          item == state.selectedItem,
                        ),
                      ))
                  .values
                  .toList(),
            ),
            bottomNavigationBar: BottomNavBar(
              items: items,
              selectedItem: state.selectedItem,
              onTap: (index) {
                final selectedItem = BottomNavItem.values[index];
                _selectBottomNavItem(
                  context,
                  selectedItem,
                  selectedItem == state.selectedItem,
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _selectBottomNavItem(
    BuildContext context,
    BottomNavItem selectedItem,
    bool isSameItem,
  ) {
    if (isSameItem) {
      navigatorKeys[selectedItem]
          .currentState
          .popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
    BottomNavItem currentItem,
    bool isSelected,
  ) {
    return Offstage(
      offstage: !isSelected,
      child: TabNavigator(
        navigatorKey: navigatorKeys[currentItem],
        item: currentItem,
      ),
    );
  }
}
