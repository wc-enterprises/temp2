import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen3.dart';
import 'package:laundry_app/widgets/bottom_sheet.dart';
import 'package:provider/provider.dart';

class DeliveryAddress extends StatefulWidget {
  Address? pickupAddress;
  String pickupTimeSlot;
  String pickupdate;
  List<String> timeSlots;
  DateTime day;
  DeliveryAddress(
      {super.key,
      required this.day,
      required this.pickupTimeSlot,
      required this.timeSlots,
      required this.pickupAddress,
      required this.pickupdate});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  Address? deliveryAddress;
  int deliveryIndex = -1;
  String? deliveryDate;
  String? deliveryTimeSlot;
  final service = IsarService();
  int selectedIndex = -1;
  DateTime _selectedDay = DateTime.now();
  DatePickerController _controller = DatePickerController();
  DateTime initialDate = DateTime.now();
  @override
  void initState() {
    initialDate = widget.day.add(Duration(days: 2));

    deliveryDate =
        "${initialDate.day}-${initialDate.month}-${initialDate.year}";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
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
                        "Delivery address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Icon(
                        Icons.check,
                        color: deliveryIndex == -1
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
          //  dateTime(),
          SizedBox(height: 24),
          Center(
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
                  if (widget.pickupAddress != null &&
                      deliveryAddress != null &&
                      deliveryTimeSlot != null &&
                      widget.timeSlots != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => OrderScreen3(
                                  pickupTimeslot: widget.pickupTimeSlot,
                                  deliveryAddress: deliveryAddress!,
                                  deliveryTimeSlot: deliveryTimeSlot,
                                  pickupAddress: widget.pickupAddress!,
                                  deliveryDate: deliveryDate,
                                  pickupDate: widget.pickupdate,
                                ))));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        backgroundColor: Color(0xff292F34),
                        content: Text(
                          "Please select all the required data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 13, bottom: 13, left: 43, right: 43),
                    child: Text("Next"))),
          ),
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

                        deliveryIndex = index;
                      });
                      deliveryAddress = snapshot.data?[index];
                      print(deliveryAddress?.addressTitle);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: deliveryIndex == index
                              ? Colors.white
                              : Color(0xff292F34),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: deliveryIndex == index
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
                              "${snapshot.data?[index].doorNumber}, ${snapshot.data?[index].street}, ${snapshot.data?[index].area}, ${snapshot.data?[index].district}, ",
                              style: TextStyle(
                                height: 1.4,
                                color: deliveryIndex == index
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.check,
                            color: deliveryIndex == index
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
            if (snapshot.error == true) {
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
                  "Delivery time slot",
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
                    deliveryDate = formattedDate;
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
                  deliveryTimeSlot = widget.timeSlots[index];
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
