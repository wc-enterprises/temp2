import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/widgets/bottom_sheet.dart';
import 'package:laundry_app/widgets/delivery_address.dart';
import 'package:provider/provider.dart';

class PickupAddress extends StatefulWidget {
  List<String> timeSlots;
  PickupAddress({super.key, required this.timeSlots});

  @override
  State<PickupAddress> createState() => _PickupAddressState();
}

class _PickupAddressState extends State<PickupAddress> {
  Address? pickupAddress;
  int pickupIndex = -1;
  String? pickupDate;
  String? pickupTimeslot;
  final service = IsarService();
  int selectedIndex = -1;
  DateTime _selectedDay = DateTime.now();
  DatePickerController _controller = DatePickerController();
  DateTime initialDate = DateTime.now();
  DateTime? selectedDate;

  @override
  void initState() {
    initialDate = initialDate.add(Duration(days: 0));
    pickupDate = "${initialDate.day}-${initialDate.month}-${initialDate.year}";
    selectedDate = initialDate;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(21),
      child: Column(
        children: [
          Container(
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
                        "Pick-up address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Icon(
                        Icons.check,
                        color: pickupIndex == -1
                            ? Colors.transparent
                            : Colors.grey,
                      ),
                    ]),
                  ),
                ),
                children: [
                  pickupAddressBox(
                    context,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return AddressBottomSheet();
                              });
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff486D98))),
                        child: const Text("Add new address",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                  )
                ]),
          ),
          dateTime(),
          DeliveryAddress(
            day: selectedDate!,
            timeSlots: widget.timeSlots,
            pickupAddress: pickupAddress,
            pickupdate: "$pickupDate",
            pickupTimeSlot: "$pickupTimeslot",
          )
        ],
      ),
    );
  }

  Widget pickupAddressBox(
    context,
  ) {
    return Consumer<OrderScreen1ViewModel>(builder: ((context, _, child) {
      return FutureBuilder(
          future: service.futureAddress(),
          builder: (context, snapshot) {
            if (snapshot.data?.isNotEmpty == true) {
              return Wrap(
                  children: List.generate(
                snapshot.data!.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        print("address selected");

                        pickupIndex = index;
                      });
                      pickupAddress = snapshot.data![index];
                      print(pickupAddress!.addressTitle);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: pickupIndex == index
                              ? Colors.white
                              : Color(0xff292F34),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: pickupIndex == index
                                ? Color(0xff292F34)
                                : Colors.white,
                          )),
                      margin: EdgeInsets.only(bottom: 19),
                      height: 52,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "${snapshot.data![index].doorNumber}, ${snapshot.data![index].street}, ${snapshot.data![index].area}, ${snapshot.data![index].district}, ",
                              style: TextStyle(
                                height: 1.4,
                                color: pickupIndex == index
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.check,
                            color: pickupIndex == index
                                ? Color(0xff596C31)
                                : Colors.transparent,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ));
            }
            if (snapshot.hasError) {
              return CircularProgressIndicator();
            }
            {
              return const Text(
                "No address to show",
                style: TextStyle(
                  height: 1.4,
                  color: Colors.white,
                  fontSize: 12,
                ),
              );
            }
          });
    }));
  }

  Widget dateTime() {
    return Padding(
      padding: EdgeInsets.only(top: 30),
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
                  "Pick-up time slot",
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
                initialDate,
                width: 60,
                height: 80,
                monthTextStyle: TextStyle(color: Colors.white),
                controller: _controller,
                initialSelectedDate: initialDate,
                selectionColor: Color(0xff486D98),
                dateTextStyle: TextStyle(color: Colors.white, fontSize: 10),
                dayTextStyle: TextStyle(color: Colors.white, fontSize: 10),
                selectedTextColor: Colors.white,
                daysCount: 30,
                onDateChange: (date) {
                  //  New date selected
                  setState(() {
                    _selectedDay = date;
                    var formattedDate =
                        "${date.day}-${date.month}-${date.year}";
                    pickupDate = formattedDate;
                    selectedDate = date;
                  });
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
                setState(() {
                  selectedIndex = index;
                  pickupTimeslot = widget.timeSlots[index];
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
