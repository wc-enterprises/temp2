import 'package:flutter/material.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/service_model.dart';

class OrderScreen1ViewModel extends ChangeNotifier {
  // selectService(Service service, value) {
  //   service.selected = value!;
  //   if (value == true) {
  //     service.textColor = Color(0xff3B4158);
  //   } else
  //     service.textColor = Colors.white;

  //   notifyListeners();
  // }

  //////////////////////orderPage2
  final pageController = PageController(initialPage: 0);
  nextPage() {
    pageController.animateToPage(1,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
    print("nextPage ");
    notifyListeners();
  }

  lastPage() {
    pageController.animateToPage(2,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
    print("nextPage ");
    notifyListeners();
  }

  previousPage() {
    pageController.animateToPage(0,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
    print("nextPage ");
    notifyListeners();
  }

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
    // selectedServices.forEach(
    //   (element) => print(element.service),
    // );
  }

  //////////////////////////////////////
  List<Address> pickUpaddress = [
    Address(
        addressTitle: "office",
        streetOrAppartmentName: "vaikumtam",
        doorNumber: "13",
        area: "Jp nagar",
        district: "delhi",
        pincode: "560076")
  ];
  List<Address> deliveryAddress = [
    Address(
        addressTitle: "office",
        streetOrAppartmentName: "vaikumtam",
        doorNumber: "13",
        area: "Jp nagar",
        district: "delhi",
        pincode: "560076")
  ];
  selectPickupAddress(Address address) {
    print("selectaddress called");
    pickUpaddress[0] = address;
    print(pickUpaddress[0].addressTitle);
  }

  selectDeliveryAddress(Address address) {
    deliveryAddress[0] = address;
    print(deliveryAddress[0].addressTitle);
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
  filterTimeSlot(List<String> timeSlot) {
    print("filter timeslot called");
    timeSlot.forEach((element) {
      element = element.replaceAll(new RegExp(r'[^0-9-]'), '');
      var b = element.split("-");
      print(b);
    });

    //  int time = int.parse(b[0]);
  }
}
