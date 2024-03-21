import 'dart:convert';

import 'package:dolarvzla/config/constants.dart';
import 'package:dolarvzla/data/remote/api_service.dart';

class EnparaleloApi {
  ApiService _apiService = ApiService(Constants.ENPARALELO_BASE_URL);
  final String _endpoint_basic_exchange = "/api/v1/dollar/unit/enparalelovzla";

  Future<Map<String, dynamic>> getBasicExchange() async {
    final response = await _apiService.get(
      endpoint: _endpoint_basic_exchange,
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else
      return {};
  }
}
