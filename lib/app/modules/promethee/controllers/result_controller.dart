import 'dart:convert';
import 'package:glow_up_app/app/data/models/product_model.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class ResultController extends GetxController {
  var answer = Get.arguments;
  var products = <Product>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchProducts();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future fetchProducts() async {
    try {
      var url = "http://10.0.2.2:8000/recommendations";
      var inputAnswer = json.encode(answer);
      await http
          .post(Uri.parse(url),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: inputAnswer)
          .then((res) {
        if (res.statusCode == 200) {
          var result = json.decode(res.body);
          final jsonItems = result.cast<Map<String, dynamic>>();
          products.value = jsonItems.map<Product>((json) {
            return Product.fromJson(json);
          }).toList();
          update(products);
        } else {
          print('Failed to load data');
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
