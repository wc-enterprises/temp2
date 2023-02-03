import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:customizable_counter/customizable_counter.dart';

class ServiceCheckbox extends StatefulWidget {
  List<Service> service;
  ServiceCheckbox({super.key, required this.service});

  @override
  State<ServiceCheckbox> createState() => _ServiceCheckboxState();
}

class _ServiceCheckboxState extends State<ServiceCheckbox> {
  Color color = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      widget.service.length,
      ((index) => GestureDetector(
            onTap: () {
              if (widget.service[index].selected == false) {
                setState(() {
                  widget.service[index].selected = true;

                  widget.service[index].textColor = Color(0xff3B4158);
                  widget.service[index].boxColor = Colors.white;
                });
              } else {
                setState(() {
                  widget.service[index].selected = false;
                  widget.service[index].textColor = Colors.white;
                  widget.service[index].boxColor = Color(0xff3B4158);
                });
              }

              print(widget.service[index].selected);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 27),
              decoration: BoxDecoration(
                color: widget.service[index].boxColor,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      widget.service[index].service,
                      style: TextStyle(color: widget.service[index].textColor),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: CustomizableCounter(
                      showButtonText: false,
                      borderColor: Colors.transparent,
                      borderWidth: 1,
                      borderRadius: 0,
                      backgroundColor: color,
                      textColor: widget.service[index].textColor,
                      textSize: 16,
                      count: 0,
                      step: 1,
                      minCount: 0,
                      maxCount: 50,
                      incrementIcon: Icon(
                        Icons.add,
                        color: widget.service[index].textColor,
                        size: 16,
                      ),
                      decrementIcon: Icon(
                        Icons.remove,
                        color: widget.service[index].textColor,
                        size: 16,
                      ),
                      onCountChange: (count) {},
                      onIncrement: (count) {},
                      onDecrement: (count) {},
                    ),
                  )
                ],
              ),
            ),
          )),
    ));
  }
}
// CheckboxListTile(
//                     title: Text(widget.service[index].service.toString(),
//                         style: TextStyle(
//                             color: widget.service[index].selected == true
//                                 ? Color.fromARGB(255, 17, 23, 46)
//                                 : Colors.white,
//                             fontSize: 14)),
//                     autofocus: false,
//                     activeColor: Colors.transparent,
//                     selectedTileColor: Colors.white,
//                     checkColor: Colors.transparent,
//                     tileColor: Color(0xff3B4158),
//                     selected: widget.service[index].selected,
//                     value: widget.service[index].selected,
//                     onChanged: (value) {
//                       setState(() {
//                         if (color == Colors.transparent) {
//                           color = Colors.white;
//                         } else {
//                           color = Colors.transparent;
//                         }
//                         widget.service[index].selected = value!;
//                       });
//                       //  print(widget.service[index].selected);
//                     },
//                   ),