import 'package:flutter/material.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:provider/provider.dart';

class AddressPicker extends StatefulWidget {
  List<Address> addresses;
  String title;
  AddressPicker({
    super.key,
    required this.addresses,
    required this.title,
  });

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  int selectedIndex = -1;

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
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check,
                    color:
                        selectedIndex == -1 ? Colors.transparent : Colors.grey,
                  ),
                ]),
              ),
            ),
            children: [
              addressBox(context),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff486D98))),
                    child: Text("Add new address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600))),
              )
            ]),
      ),
    );
  }

  Widget addressBox(context) {
    return Wrap(
        children: List.generate(
      widget.addresses.length,
      (index) => Padding(
        padding: EdgeInsets.only(left: 20, right: 10),
        child: InkWell(
          onTap: () {
            setState(() {
              print("address selected");

              selectedIndex = index;

              //print(widget.addresses[index].isSelected);
            });
            if (widget.title == "Pick-up address") {
              Provider.of<OrderScreen1ViewModel>(context)
                  .selectPickupAddress(widget.addresses[index]);
            }
            if (widget.title == "Delivery address") {
              Provider.of<OrderScreen1ViewModel>(context)
                  .selectDeliveryAddress(widget.addresses[index]);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color:
                    selectedIndex == index ? Colors.white : Color(0xff292F34),
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                  color:
                      selectedIndex == index ? Color(0xff292F34) : Colors.white,
                )),
            margin: EdgeInsets.only(bottom: 19),
            height: 44,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    "${widget.addresses[index].doorNumber},${widget.addresses[index].streetOrAppartmentName}, ${widget.addresses[index].area}, ${widget.addresses[index].district}, ${widget.addresses[index].pincode}",
                    style: TextStyle(
                      height: 1.4,
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.check,
                  color: selectedIndex == index
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
}
