import 'package:http/http.dart' as http;
import 'package:shop_getx_repeat_coding/app/data/model/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await client.get('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if(response.statusCode == 200) {
      var jsonString = response.body;

      return productFromJson(jsonString);
    }else {
      return [];
    }
  }
}