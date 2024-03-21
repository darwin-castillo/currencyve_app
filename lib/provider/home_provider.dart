import 'dart:convert';

import 'package:dolarvzla/data/remote/enparalelo_api.dart';
import 'package:dolarvzla/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class HomeProvider with ChangeNotifier {


  HomeProvider(){
    getBasicData();
  }
  double _value = 0;
  double get value => _value;

  String _formattedAmount = "0";
  String get formattedAmount => _formattedAmount;

  set formattedAmount(String val) {
    _formattedAmount = val;
    notifyListeners();
  }

  CurrencyModel _currency = CurrencyModel(value: 1);
  CurrencyModel get currency => _currency;
  NumberFormat currencyFormat = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );
  set currency(CurrencyModel val) {
    _currency = val;
    notifyListeners();
  }

  set value(double val) {
    _value = val;
    notifyListeners();
  }

  MoneyMaskedTextController moneyMasked = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    precision: 2,
  );
  void getBasicData() async {
    Map<String, dynamic> response = await EnparaleloApi().getBasicExchange();
    print(json.encode(response));
    currency = CurrencyModel.fromJson(response);
  }

  void calcValue() {
    value = (moneyMasked.numberValue) / (currency.value ?? 1);
    formattedAmount = currencyFormat.format(value);
  }
}
