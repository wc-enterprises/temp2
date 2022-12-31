import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/models/service_model.dart';

class ServiceCheckbox extends StatefulWidget {
  List<Service> service;
  ServiceCheckbox({super.key, required this.service});

  @override
  State<ServiceCheckbox> createState() => _ServiceCheckboxState();
}

class _ServiceCheckboxState extends State<ServiceCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      widget.service.length,
      ((index) => Container(
            margin: EdgeInsets.only(top: 27),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(7),
            ),
            child: CheckboxListTile(
              title: Text(widget.service[index].service.toString(),
                  style: TextStyle(
                      color: widget.service[index].selected == true
                          ? Color.fromARGB(255, 17, 23, 46)
                          : Colors.white,
                      fontSize: 14)),
              autofocus: false,
              activeColor: Colors.transparent,
              selectedTileColor: Colors.white,
              checkColor: Color(0xffD9D2D2),
              tileColor: Color(0xff3B4158),
              selected: widget.service[index].selected,
              value: widget.service[index].selected,
              onChanged: (value) {
                setState(() {
                  widget.service[index].selected = value!;
                });
                //  print(widget.service[index].selected);
              },
            ),
          )),
    ));
  }
}
