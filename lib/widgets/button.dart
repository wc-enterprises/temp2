import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  var onTap;
  String title;
  ButtonWidget({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xff486D98)),
            ),
            onPressed: () {
              onTap;
            },
            child: Padding(
                padding:
                    EdgeInsets.only(top: 13, bottom: 13, left: 43, right: 43),
                child: Text(title))),
      ),
    );
  }
}
