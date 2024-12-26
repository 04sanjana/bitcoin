import 'dart:convert';
import 'package:http/http.dart' as http;


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
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
  const apiKey= 'F7498F59-C567-4436-94CB-BF06B80B9265';

class CoinData {
  Future getCoinData(String currency)async
  {

    String requestURL = '$coinAPIURL/BTC/USD?apikey=F7498F59-C567-4436-94CB-BF06B80B9265';
    http.Response response = await http.get(Uri.parse(requestURL));

    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);
      double lastPrice = (decodedData['rate'] ?? 0.0) as double;



      return lastPrice.toStringAsFixed(0);
    }
    else {
      print(response.statusCode);
      throw 'problem eith get rqst';
    }
  }
}