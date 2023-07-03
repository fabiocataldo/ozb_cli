import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ozb_cli/models/product_list_model.dart';
import 'package:ozb_cli/repo/api_status.dart';
import '../utils/constants.dart';

class ProductService {
  static Future<Object> getProducts() async {
    try {
      var url = Uri.parse(API_URL);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return Success(code: 200, response: productListFromJson(response.body));
      }

      return Failure(code: INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
