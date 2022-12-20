import 'package:flutter/material.dart';

class Service {
  Services service;
  double amount; //amount per kg/piece
  bool selected;
  Color textColor;
  Service(
      {required this.service,
      required this.amount,
      this.selected = false,
      this.textColor = Colors.white});
}

enum Services { washing, ironing, washAndIron, dryCleaning }
