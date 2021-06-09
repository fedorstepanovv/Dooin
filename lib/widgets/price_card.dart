import 'package:dooin/config/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PriceCard extends StatelessWidget {
  final String name;
  final String price;
  final String priceChange;
  final String symbol;
  final String url;
  const PriceCard(
      {Key key,
      @required this.url,
      @required this.name,
      @required this.price,
      @required this.priceChange,
      @required this.symbol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          symbol,
                          style: const TextStyle(color: ColorPallete.grey),
                        )
                      ],
                    ),
                    double.parse(priceChange) <= 0
                        ? Text(price,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                        : Text(
                            price,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          )
                  ],
                )),
            color: ColorPallete.cardBackgroundColor,
          ),
        ));
  }
}
