import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:node_tutorial/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.0.104:3500/api/";

  // create product method
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

  // read product method
  static getProduct() async {
    List<ProductModel> products = [];

    var url = Uri.parse("${baseUrl}get_product");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        data['products'].forEach((value) => {
              products.add(ProductModel(
                  id: value['id'].toString(), name: value['productName'], price: value['productPrice'], description: value['productDescription']))
            });
        return products;
        // print(data);
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // update product method
  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update_product/$id");
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      print("Failed to update data");
    }
  }

  // delete product method
  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete_product/$id");
    final response = await http.post(url);
    if (response.statusCode == 204) {
      print("Product Deleted Successfully!");
    } else {
      throw Exception("Failed to delete product");
    }
  }
}
