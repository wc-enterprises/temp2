import 'package:flutter/material.dart';

class Service {
  String service;
  double amount; //amount per kg/piece
  double? piece;
  String? unit;
  bool selected;
  Color textColor;
  Color? boxColor;
  Service(
      {required this.service,
      required this.amount,
      this.piece,
      this.unit,
      this.selected = false,
      this.boxColor,
      this.textColor = Colors.white});

  factory Service.fromJson(Map<String, dynamic> service) {
    return Service(
      service: service["service"],
      amount: service["amount"],
      unit: service["unit"],
      piece: service["piece"],
    );
  }
  toJson() {
    return {"service": service, "amount": amount, "piece": piece, "unit": unit};
  }
}
