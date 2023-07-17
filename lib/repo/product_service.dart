import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ozb_cli/models/product_list_model.dart';

class ProductService {
  static Future<List<ProductList>> getProducts() async {
    try {
      var basicAuth = 'Basic ${base64Encode(utf8.encode('ozb@localhost:bb6D1225LT7p7Ss071Lj7858O808p5v7'))}';

      final response = await http.get(
        Uri.parse('http://ec2-13-48-194-8.eu-north-1.compute.amazonaws.com/api/products/'),
        headers: {'Authorization': basicAuth},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        if (jsonResponse != null) {
          if (jsonResponse is List) {
            List<ProductList> productList = jsonResponse
                .map((item) => ProductList.fromJson(item))
                .toList();

            return productList;
          } else if (jsonResponse is Map<String, dynamic>) {
            // Trate a resposta como um objeto e extraia a lista de produtos
            if (jsonResponse.containsKey('products')) {
              var productsData = jsonResponse['products'] as List<dynamic>;

              List<ProductList> productList = productsData
                  .map((item) => ProductList.fromJson(item))
                  .toList();

              return productList;
            } else {
              throw Exception('Failed to get products: Invalid response format');
            }
          } else {
            throw Exception('Failed to get products: Invalid response format');
          }
        } else {
          throw Exception('Failed to get products: Response is null');
        }
      } else {
        throw Exception('Failed to get products. Status code: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('Erro ao obter produtos: $e');
      print(stackTrace);
      throw Exception('Falha ao obter produtos: $e');
    }
  }
}
