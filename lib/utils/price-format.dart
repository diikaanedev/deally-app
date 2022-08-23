import 'package:flutter_money_formatter/flutter_money_formatter.dart';

priceFormatByDii(int price) {
  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
      amount: double.parse(price.toString()),
      settings: MoneyFormatterSettings(symbol: " NGN"));
  return fmf.output.symbolOnRight;
}
