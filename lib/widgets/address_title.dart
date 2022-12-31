import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddressTitle extends StatefulWidget {
  const AddressTitle({super.key});

  @override
  State<AddressTitle> createState() => _AddressTitleState();
}

class _AddressTitleState extends State<AddressTitle> {
  List<String> addressTitle = ["Home", "Work", "Other"];
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 8),
      child: Wrap(
          spacing: 14,
          runSpacing: 10,
          children: List.generate(
            addressTitle.length,
            (index) => InkWell(
              onTap: () {
                print("address title selected");
                setState(() {
                  selectedIndex = index;
                  print(selectedIndex);
                  print(index);
                });
              },
              child: Container(
                height: 35,
                width: 76,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color(0xff486D98)
                        : Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    addressTitle[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
