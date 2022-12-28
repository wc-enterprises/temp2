import 'package:flutter/material.dart';

class BillScreenButtons extends StatelessWidget {
  const BillScreenButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(title: "Cancel",textColor: Colors.black, buttonColor: Colors.white, icon: Icons.cancel, onPressed: () {  },),
          CustomButton(title: "Drop Address",textColor: Colors.black, buttonColor: Color(0xffD7EF7D), icon: Icons.edit, onPressed: () {  },),
          CustomButton(title: "Time-slot",textColor: Colors.black, buttonColor: Color(0xffD7EF7D), icon: Icons.edit, onPressed: () {  },),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final IconData ?icon;
  final String title;
  final VoidCallback onPressed;

  CustomButton({
    required this.buttonColor,
    required this.textColor,
    required this.title,
    required this.onPressed,
    this.icon,
    
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      child: Row(
        children: [
          Icon(icon, size: 12, color: textColor,),
          Text(title, style: TextStyle(color: textColor, fontSize: 12, fontWeight: FontWeight.w400),),
        ],
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            ),),
      ),
    );
  }
}