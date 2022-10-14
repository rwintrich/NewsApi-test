import 'dart:convert';

import 'package:challenger_flutter_deloitte/features/show_items/data/models/item_info_model.dart';
import 'package:http/http.dart' as httpClient;

abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams);
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams) async {
    final httpClient.Response response = await httpClient
        .get(Uri.parse(url).replace(queryParameters: queryParams));
    // TODO: implement getData
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Status code: " + response.statusCode.toString());
    }
  }
}
