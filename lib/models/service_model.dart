import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laundry_app/models/sub_service.dart';

class Service {
  String service;

  List<Product>? products;
  bool selected;
  Color textColor;
  Color? boxColor;
  Service(
      {required this.service,
      this.products,
      this.selected = false,
      this.boxColor,
      this.textColor = Colors.white});

  factory Service.fromJson(Map<String, dynamic> service) {
    List<Product> getProducts(List<Map<String, dynamic>> p) {
      List<Product> products = [];
      if (p.length > 0) {
        p.forEach((element) {
          products.add(Product.fromJson(element));
        });
      }
      return products;
    }

    return Service(
      products: getProducts(service["subService"]),
      service: service["service"],
    );
  }
  toJson() {
    return {
      "service": service,
    };
  }

  static getService() async {
    final String jsonData =
        await rootBundle.loadString('lib/models/sample_data.json');
    final allData = jsonDecode(jsonData);
    print(allData);
    List<dynamic> data = allData["services"];
    List<Product> products = [];
    data.forEach((element) {
      products.add(Product.fromJson(element));
    });
    print(products);
    return products;
  }
}
