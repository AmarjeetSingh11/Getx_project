import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/coin_model.dart';
class CoinController extends GetxController{

  RxBool isLoading = true.obs;
  RxList<Coin> coinList = <Coin>[].obs;


  fetchCoin()async{

    try{
      isLoading(true);
      var response = await http.get(Uri.parse('https://coingecko.p.rapidapi.com/coins/markets?page=1&sparkline=false&vs_currency=usd&per_page=100&order=market_cap_desc'));

      if (kDebugMode) {
        print(response);
      }

      List<Coin> coins = coinFromJson(response.body);

      coinList.value = coins;
    }finally{

      isLoading(false);

    }

  }


}