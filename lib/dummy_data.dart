import 'dart:developer';

import 'models/address_model.dart';
import 'models/order_model.dart';
import 'models/service_model.dart';

//Just dummy data file for passing and testing data from model

List<Address> address = [
  Address(
      street: "Akshaya",
      addressTitle: "Home",
      doorNumber: "c2-603",
      area: "Urapakkam chennai guindy thambaram",
      district: "chennai",
      pincode: "603210"),
  Address(
      addressTitle: "Work",
      street: "Safa",
      doorNumber: "13",
      area: "Jp nagar",
      district: "bangalore",
      pincode: "560076")
];

List<Order> orderdetails = [
  Order(
    id: "1234",
    pickTimeSlot: "23 Nov 2022,9am-12pm",
    deliveryTimeSlot: "25 Nov 2022,9am-12pm",
    pickUpAddress: address[0],
    deliveryAddress: address[1],
    status: Status.delivered,
  ),
  Order(
    id: "1235",
    pickTimeSlot: "30 Nov 2022,9am-12pm",
    deliveryTimeSlot: "25 Nov 2022,9am-12pm",
    pickUpAddress: address[0],
    deliveryAddress: address[1],
    status: Status.orderPlaced,
  ),
  Order(
    id: "1236",
    pickTimeSlot: "15 Nov 2022,9am-12pm",
    deliveryTimeSlot: "25 Nov 2022,9am-12pm",
    pickUpAddress: address[0],
    deliveryAddress: address[1],
    status: Status.outForDelivery,
  ),
  Order(
    id: "1237",
    pickTimeSlot: "10 Nov 2022,9am-12pm",
    deliveryTimeSlot: "25 Nov 2022,9am-12pm",
    pickUpAddress: address[0],
    deliveryAddress: address[1],
    status: Status.delivered,
  ),
  Order(
    id: "1238",
    pickTimeSlot: "10 Sep 2022,9am-12pm",
    deliveryTimeSlot: "25 Sep 2022,9am-12pm",
    pickUpAddress: address[0],
    deliveryAddress: address[1],
    status: Status.waitingForConfirmation,
  ),
];
