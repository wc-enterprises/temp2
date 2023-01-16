import 'package:laundry_app/models/order_model.dart';

import 'address_model.dart';

class UserModel {
  String? id;
  String? name;
  String? phoneNumber;
  late List<String>? location; //(lattitude,longitude)
  List<Address>? address;
  // List<Order>? orders;
  UserModel({
    this.id,
    this.name,
    this.address,
    this.location,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "id": id,
      "location": location,
      "address": getAddress(address),
      // "orders": getOrder(orders),
    };
  }

  List<Map<String, dynamic>> getAddress(List<Address>? address) {
    List<Map<String, dynamic>> userAddress = [];
    if (address != null) {
      for (var i = 0; i < address!.length; i++) {
        userAddress.add(address[i].toJson());
      }
    }
    return userAddress;
  }

  List<Map<String, dynamic>> getOrder(List<Order>? order) {
    List<Map<String, dynamic>> orders = [];
    if (order?.length != 0) {
      order!.forEach((element) {
        orders.add(element.toJson());
      });
      return orders;
    }
    return orders;
  }
}
//address?.map((e) => e.toJson()),
