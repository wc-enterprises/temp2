import 'package:laundry_app/models/address_model.dart';

class Store {
  String id;
  String name;
  Address address;
  String phoneNumber;
  StoreStatus status;
  Store(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.status});
}

enum StoreStatus { acceptingOrders, notAcceptingOrders }
