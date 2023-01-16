import 'package:flutter/material.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/models/service_model.dart';

class OrderScreen1ViewModel extends ChangeNotifier {
/////////////////////////////////////////
  List<Service> selectedServices = [];

  selectService(List<Service> service) {
    if (selectedServices.length != 0) {
      selectedServices.clear();
      notifyListeners();
    }

    service.forEach((element) {
      if (element.selected == true) {
        selectedServices.add(element);
        notifyListeners();
      }
    });
  }

  //////////////////////////////////////
  List<Address> pickUpaddress = [
    Address(
      addressTitle: "office",
      street: "vaikumtam",
      doorNumber: "13",
      area: "Jp nagar",
      district: "delhi",
    )
  ];
  List<Address> deliveryAddress = [
    Address(
      addressTitle: "office",
      street: "vaikumtam",
      doorNumber: "13",
      area: "Jp nagar",
      district: "delhi",
    )
  ];
  void selectPickupAddress(Address address) {
    pickUpaddress[0] = address;
    print(pickUpaddress[0].addressTitle);
    notifyListeners();

    print("selectaddress called");
  }

  void selectDeliveryAddress(Address address) {
    deliveryAddress[0] = address;
    print(deliveryAddress[0].addressTitle);
    notifyListeners();

    print("selectaddress called");
  }

////////////////////////////
  List<String> timeSlot = [
    "9am-12pm",
    "12pm-2pm",
    "2pm-4pm",
    "4pm-6pm",
    "6pm-8pm",
    "8pm-10pm"
  ];
  void filterTimeSlot(List<String> timeSlot) {
    print("filter timeslot called");
    timeSlot.forEach((element) {
      element = element.replaceAll(new RegExp(r'[^0-9-]'), '');
      var b = element.split("-");
      print(b);
    });
  }

  String? pickUpTimeSlot;
  String? deliveryTimeSlot;
  String? pickupDate;
  String? deliveryDate;

  void selectPickUpTimeSlot(String timeSlot) {
    timeSlot = pickUpTimeSlot!;
    notifyListeners();
    print("function");
    print(pickUpTimeSlot);
    notifyListeners();
  }

  void selectDeliveryTimeSlot(String timeSlot) {
    deliveryTimeSlot = timeSlot;
    notifyListeners();
    print("function");

    print(deliveryTimeSlot);
    notifyListeners();
  }

  void selectPickupDate(date) {
    pickupDate = date;
    notifyListeners();
    print("function");

    print(pickupDate);
    notifyListeners();
  }

  void selectDeliveryDate(date) {
    deliveryDate = date;
    notifyListeners();
    print("function");

    print(deliveryDate);
    notifyListeners();
  }
}
