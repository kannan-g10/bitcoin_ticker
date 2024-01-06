import 'package:bitcoin_ticker/price_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BitCoinTicker());

class BitCoinTicker extends StatelessWidget {
  const BitCoinTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SafeArea(child: PriceScreen()),
    );
  }
}
