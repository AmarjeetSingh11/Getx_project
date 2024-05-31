// To parse this JSON data, do
//
//     final coin = coinFromJson(jsonString);

import 'dart:convert';

List<Coin> coinFromJson(String str) => List<Coin>.from(json.decode(str).map((x) => Coin.fromJson(x)));

String coinToJson(List<Coin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Coin {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? currentPrice;
  int? marketCap;
  int? marketCapRank;
  int? totalVolume;
  int? high24H;
  int? low24H;
  double? priceChange24H;
  double? priceChangePercentage24H;
  int? marketCapChange24H;
  double? marketCapChangePercentage24H;
  int? circulatingSupply;
  int? ath;
  double? athChangePercentage;
  DateTime? athDate;
  double? atl;
  double? atlChangePercentage;
  DateTime? atlDate;
  dynamic? roi;

  Coin({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.circulatingSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
    id: json["id"],
    symbol: json["symbol"],
    name: json["name"],
    image: json["image"],
    currentPrice: json["current_price"],
    marketCap: json["market_cap"],
    marketCapRank: json["market_cap_rank"],
    totalVolume: json["total_volume"],
    high24H: json["high_24h"],
    low24H: json["low_24h"],
    priceChange24H: json["price_change_24h"].toDouble(),
    priceChangePercentage24H: json["price_change_percentage_24h"].toDouble(),
    marketCapChange24H: json["market_cap_change_24h"],
    marketCapChangePercentage24H: json["market_cap_change_percentage_24h"].toDouble(),
    circulatingSupply: json["circulating_supply"],
    ath: json["ath"],
    athChangePercentage: json["ath_change_percentage"].toDouble(),
    athDate: DateTime.parse(json["ath_date"]),
    atl: json["atl"].toDouble(),
    atlChangePercentage: json["atl_change_percentage"].toDouble(),
    atlDate: DateTime.parse(json["atl_date"]),
    roi: json["roi"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "symbol": symbol,
    "name": name,
    "image": image,
    "current_price": currentPrice,
    "market_cap": marketCap,
    "market_cap_rank": marketCapRank,
    "total_volume": totalVolume,
    "high_24h": high24H,
    "low_24h": low24H,
    "price_change_24h": priceChange24H,
    "price_change_percentage_24h": priceChangePercentage24H,
    "market_cap_change_24h": marketCapChange24H,
    "market_cap_change_percentage_24h": marketCapChangePercentage24H,
    "circulating_supply": circulatingSupply,
    "ath": ath,
    "ath_change_percentage": athChangePercentage,
    "ath_date": athDate?.toIso8601String(),
    "atl": atl,
    "atl_change_percentage": atlChangePercentage,
    "atl_date": atlDate?.toIso8601String(),
    "roi": roi,
  };
}

