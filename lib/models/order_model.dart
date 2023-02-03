import 'package:laundry_app/models/sub_service.dart';

import 'service_model.dart';
import 'address_model.dart';

class Order {
  String id;

  String? userName;
  String pickTimeSlot;
  String? deliveryTimeSlot;
  Address pickUpAddress;
  Address deliveryAddress;
  String? phoneNumber;
  Status? status;
  List<Product>? selectedService;
  String? pickupDate;
  String? deliveryDate;
  String? orderStatus;
  List<String>? addOn;
  List<String>? deliveryInstruction;
  // List<Map<Service, double>>?
  //     serviceAmount; //service charge per kg/piece * quantity(number of piece or number of kg)
  // late double? totalServiceAmount;
  // late double? totalAmount;
  // late double? tax;
  // double? deliveryFee;

  Order({
    required this.id,
    this.userName,
    required this.pickTimeSlot,
    this.pickupDate,
    this.deliveryDate,
    this.deliveryTimeSlot,
    required this.pickUpAddress,
    required this.deliveryAddress,
    this.phoneNumber,
    this.status,
    this.selectedService,
    this.orderStatus,
    this.addOn,
    this.deliveryInstruction,

    // this.serviceAmount,
    // this.deliveryFee,
    // this.totalAmount,
    // this.tax,
  });

  factory Order.fromJson(Map<String, dynamic> order) {
    List<Service> serviceFromJson(List<dynamic> service) {
      List<Service> services = [];
      if (service.isNotEmpty) {
        service.forEach((element) {
          services.add(Service.fromJson(element));
        });
        return services;
      }
      return services;
    }

    return Order(
        id: order["id"],
        orderStatus: order["orderStatus"],
        pickTimeSlot: order["pickUpTimeslot"],
        pickupDate: order["pickupDate"],
        deliveryDate: order["deliveryDate"],
        deliveryTimeSlot: order["deliveryTimeslot"],
        pickUpAddress: order["pickupAddress"],
        deliveryAddress: order["deliveryAddress"],
        addOn: List.from(order["addOn"]),
        deliveryInstruction: List.from(order["deliveryInstructions"])

        // selectedService: serviceFromJson(order["services"])
        );
  }

  toJson() {
    return {
      "id": id,
      "orderStatus": orderStatus,
      "pickupDate": pickupDate,
      "deliveryDate": deliveryDate,
      "pickupTimeSlot": pickTimeSlot,
      "pickupAddress": pickUpAddress.toJson(),
      "deliveryTimeSlot": deliveryTimeSlot,
      "deliveryAddress": deliveryAddress.toJson(),
      "addOn": addOn,
      "deliveryInstruction": deliveryInstruction
      // "services": selectedServicesToJson(selectedService),
    };
  }

  List<Map<String, dynamic>> selectedServicesToJson(List<Service> service) {
    List<Map<String, dynamic>> services = [];
    service.forEach((element) {
      services.add(element.toJson());
    });
    return services;
  }
}

enum Status { waitingForConfirmation, orderPlaced, outForDelivery, delivered }
