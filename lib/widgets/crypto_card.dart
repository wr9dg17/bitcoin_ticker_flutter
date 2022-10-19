import 'package:flutter/material.dart';

import '../coin_data.dart';

class CryptoCard extends StatelessWidget {
  final String coin;
  final String ccy;
  final CoinData coinData;

  const CryptoCard({
    Key? key,
    required this.coin,
    required this.ccy,
    required this.coinData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: FutureBuilder<String>(
            future: coinData.getCoinRate(coin, ccy),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              String? result = 'Loading...';
              if (snapshot.hasData) result = snapshot.data;
              return Text(
                result!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
