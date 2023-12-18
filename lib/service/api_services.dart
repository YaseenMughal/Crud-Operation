import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:node_tutorial/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.0.104:3500/api/";

  static addProduct(Map productData) async {
    print(productData);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final response = await http.post(url, body: productData);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print("Failed to get response!");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProduct() async {
    List<ProductModel> products = [];

    var url = Uri.parse("${baseUrl}get_product");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        data['products'].forEach((value) =>
            {products.add(ProductModel(name: value['productName'], price: value['productPrice'], description: value['productDescription']))});
        return products;
        // print(data);
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
