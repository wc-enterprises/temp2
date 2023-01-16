import 'package:flutter/material.dart';

class BIllHeader extends StatelessWidget {
  const BIllHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(40, 30, 40, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Laundry in Progress", style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.white),),
          SizedBox(height: 10,),
          Text("Thank you for your laundry order!\nYour clothes will be clean and fresh\nin no time.", style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: Colors.grey),),
        ],
      ),
    );
  }
}