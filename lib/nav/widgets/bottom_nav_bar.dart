
import 'package:dooin/config/color_pallete.dart';
import 'package:dooin/enums/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Map<BottomNavItem, IconData> items;
  final BottomNavItem selectedItem;
  final Function(int) onTap;

  const BottomNavBar({
    Key key,
    @required this.items,
    @required this.selectedItem,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorPallete.navBarColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: ColorPallete.grey,
      currentIndex: BottomNavItem.values.indexOf(selectedItem),
      onTap: onTap,
      items: items
          .map((item, icon) => MapEntry(
                item.toString(),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(icon, size: 24.0),
                ),
              ))
          .values
          .toList(),
    );
  }
}