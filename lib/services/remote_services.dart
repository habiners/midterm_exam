import 'package:http/http.dart' as http;
import 'package:shopx/models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        List<Product> products = productFromJson(jsonString);
        return products;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
