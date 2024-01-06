import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedItem = 'USD';

  DropdownButton androidPicker() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );

      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      value: selectedItem,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedItem = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> currenciesNamesWidget = [];
    for (String currency in currenciesList) {
      var newItem = Text(
        currency,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      );
      currenciesNamesWidget.add(newItem);
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedItem) {
        if (kDebugMode) {
          print(selectedItem);
        }
      },
      children: currenciesNamesWidget,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 28,
                ),
                child: Text(
                  '1BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            color: Colors.lightBlueAccent,
            padding: const EdgeInsets.only(bottom: 30),
            child: Platform.isIOS ? iOSPicker() : androidPicker(),
          )
        ],
      ),
    );
  }
}
