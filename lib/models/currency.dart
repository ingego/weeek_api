import 'dart:convert';

class Currency {
  final int id;
  final String name;
  final String code;
  final String symbol;

  Currency({
    required this.id,
    required this.name,
    required this.code,
    required this.symbol,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      symbol: json['symbol'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'symbol': symbol,
    };
  }

  factory Currency.fromString(String jsonString) {
    return Currency.fromJson(json.decode(jsonString));
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
