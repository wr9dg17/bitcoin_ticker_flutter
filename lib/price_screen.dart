import 'dart:io' show Platform;
import 'package:bitcoin_ticker_flutter/widgets/crypto_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bitcoin_ticker_flutter/coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCcy = 'USD';
  CoinData coinData = CoinData();

  DropdownButton<String> renderDropdown() {
    return DropdownButton<String>(
      value: selectedCcy,
      items: currenciesList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCcy = value!;
        });
      }
    );
  }

  CupertinoPicker renderPicker() {
    return CupertinoPicker(
      itemExtent: 30.0,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCcy = currenciesList[index];
        });
      },
      children: List.generate(currenciesList.length, (index) {
        return Text(currenciesList[index]);
      })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(cryptoList.length, (index) {
                return CryptoCard(
                  coin: cryptoList[index],
                  ccy: selectedCcy,
                  coinData: coinData,
                );
              }),
            )
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 15.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? renderDropdown() : renderPicker(),
          ),
        ],
      ),
    );
  }
}
