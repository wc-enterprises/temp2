import 'package:flutter/material.dart';

class AddressButton extends StatefulWidget {
  String name;
  VoidCallback onPressed;

  AddressButton({required this.name, required this.onPressed});

  @override
  State<AddressButton> createState() => _AddressButtonState();
}

class _AddressButtonState extends State<AddressButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            backgroundColor: Color(0xff3B4158),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
    );
  }
}
