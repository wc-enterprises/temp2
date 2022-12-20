import 'package:flutter/material.dart';

class Address {
  String addressTitle;
  String doorNumber;
  String? streetOrAppartmentName;
  String area;
  String district;
  String pincode;
  String? landmark;
  Address({
    required this.addressTitle,
    required this.doorNumber,
    required this.streetOrAppartmentName,
    required this.area,
    this.landmark,
    required this.district,
    required this.pincode,
  });

  Map<String, dynamic> toJson() {
    return {
      'addressTitle': addressTitle,
      'doorNumber': doorNumber,
      'street': streetOrAppartmentName,
      'area': area,
      'landMark': landmark,
      'district': district,
      'pincode': pincode,
    };
  }
}
