import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/models/sub_service.dart';
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:provider/provider.dart';

class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  List<Product> products = [];
  List<String> category = ["Washing", "Dry Clean", "Steam Iron"];

  String? selectedSubService;
  String? selectedService;
  List<Product> sample = [];
  String price = "";
  @override
  void initState() {
    getList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.6,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: 16,
                )
              ]),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 30, right: 30, bottom: 30),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text("Preparing your basket",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3B4158))),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    ////////////////////////////////
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(
                                color: Color(0xff3B4158),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                buttonPadding:
                                    const EdgeInsets.only(left: 8, right: 8),
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  color: Colors.white,
                                ),
                                buttonHeight: 40,
                                buttonWidth: 230,
                                itemHeight: 40,
                                isExpanded: true,
                                value: selectedService,
                                itemPadding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                hint: Text(
                                  "Category",
                                ),
                                items: category
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (value) {
                                  // subServiceList.clear();

                                  setState(() {
                                    selectedSubService = null;
                                    selectedService = value;

                                    sample = products
                                        .where((element) =>
                                            element.category.toLowerCase() ==
                                            value?.toLowerCase())
                                        .toList();
                                  });
                                  print(sample.length);
                                }),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Text(
                              "Product",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff3B4158),
                                  fontSize: 16),
                            ),
                            Spacer(),
                            DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                    buttonPadding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    buttonDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                      color: Colors.white,
                                    ),
                                    buttonHeight: 40,
                                    buttonWidth: 230,
                                    itemHeight: 40,
                                    dropdownWidth: 250,
                                    // dropdownMaxHeight: 200,
                                    value: selectedSubService,
                                    hint: Text(
                                      "Select product",
                                    ),
                                    items: sample
                                        .map((e) => DropdownMenuItem(
                                            value: e.name, child: Text(e.name)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSubService = value;
                                        getPrice(value);
                                      });
                                    }))
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 16, bottom: 30),
                      child: Row(children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff3B4158),
                              fontSize: 16),
                        ),
                        Spacer(),
                        Container(
                          height: 40,
                          width: 230,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "$price ₹",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ]),
                    ),

                    Center(
                        child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xff486D98)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 13, bottom: 13, left: 43, right: 43),
                          child: Text("Add")),
                      onPressed: () {
                        if (selectedService != null &&
                            selectedSubService != null) {
                          Provider.of<OrderScreen1ViewModel>(context,
                                  listen: false)
                              .addService(Product(
                                  category: selectedService!,
                                  unitPrice: 10,
                                  name: selectedSubService!));
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 3),
                              backgroundColor: Color(0xff292F34),
                              content: Text(
                                "Please select all required data",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      },
                    )),
                  ])),
            ),
          ),
        ));
  }

  getPrice(value) {
    products.forEach((element) {
      if (element.name == value) {
        price = element.unitPrice.toString();
      }
    });
  }

  getList() async {
    products = await Service.getService();
  }
}
//////////////////
