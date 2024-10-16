import 'dart:convert';

import 'package:demo_app/models/product.model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String endPoint = "http://localhost:3000";
  getAll() async {
    Uri url = Uri.parse("$endPoint/shoping/products");
    // var url = Uri.http(endPoint, '/shoping/products');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      print(response.body);
      // return ProductModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      // throw Exception('Failed to load album');
    }
  }
}
