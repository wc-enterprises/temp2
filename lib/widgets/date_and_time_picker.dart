import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DateTimeSlotPicker extends StatefulWidget {
  List<String> timeSlots;
  DateTimeSlotPicker({super.key, required this.timeSlots});

  @override
  State<DateTimeSlotPicker> createState() => _DateTimeSlotPickerState();
}

class _DateTimeSlotPickerState extends State<DateTimeSlotPicker> {
  int selectedIndex = -1;

  DateTime _selectedDay = DateTime.now();
  DatePickerController _controller = DatePickerController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(21),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Color(0xff292F34),
        ),
        width: double.infinity,
        child: ExpansionTile(
          backgroundColor: Color(0xff292F34),
          title: Container(
            height: 70,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 21, left: 10, bottom: 21),
              child: Row(children: [
                Text(
                  "Select Time-slot",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(
                  Icons.check,
                  color: selectedIndex != -1 ? Colors.grey : Colors.transparent,
                )
              ]),
            ),
          ),
          children: [
            Container(
              child: DatePicker(
                DateTime.now(),
                width: 60,
                height: 80,
                monthTextStyle: TextStyle(color: Colors.white),
                controller: _controller,
                initialSelectedDate: DateTime.now(),
                selectionColor: Color(0xff486D98),
                dateTextStyle: TextStyle(color: Colors.white, fontSize: 10),
                dayTextStyle: TextStyle(color: Colors.white, fontSize: 10),
                selectedTextColor: Colors.white,
                daysCount: 30,
                onDateChange: (date) {
                  //  New date selected
                  setState(() {
                    _selectedDay = date;
                  });
                  print(date);
                  print(date.hour);
                  print(DateTime.now());
                },
              ),
            ),
            SizedBox(height: 20),
            timeSlot(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget timeSlot() {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Wrap(
          spacing: 14,
          runSpacing: 10,
          children: List.generate(
            widget.timeSlots.length,
            (index) => InkWell(
              onTap: () {
                print("timeSlot selected");
                setState(() {
                  selectedIndex = index;
                  print(selectedIndex);
                });
              },
              child: Container(
                height: 25,
                width: 76,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color(0xff486D98)
                        : Color(0xffD3D3D3),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text(
                    widget.timeSlots[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
