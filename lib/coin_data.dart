import 'package:bitcoin_ticker_flutter/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<String> getCoinRate(String coin, String ccy) async {
    NetworkHelper networkHelper = NetworkHelper(
      Uri.https('rest.coinapi.io', '/v1/exchangerate/$coin/$ccy', {
      'apiKey': dotenv.env['COIN_API_KEY']
      })
    );

    dynamic data = await networkHelper.getData();
    double rate = data["rate"];

    return '1 $coin = ${rate.toStringAsFixed(0)} $ccy';
  }
}
