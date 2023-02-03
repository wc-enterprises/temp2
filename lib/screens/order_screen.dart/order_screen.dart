import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/models/sub_service.dart';
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/add_service.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen2.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomeScreen())));
            },
            child: Icon(Icons.chevron_left)),
      ),
      backgroundColor: Color(0xff3B4158),
      body: Consumer<OrderScreen1ViewModel>(builder: ((context, _, child) {
        List<Product> services =
            context.watch<OrderScreen1ViewModel>().newService;
        return SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
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
                            color: Colors.white)),
                  ),
                  RichText(
                    text: const TextSpan(
                      text: 'Customize ',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Color(0xffD9D2D2)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'select how you wish to do your laundry',
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 16),
                              padding: EdgeInsets.all(12),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 1.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                services[index].name!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Provider.of<OrderScreen1ViewModel>(context,
                                        listen: false)
                                    .deleteService(services[index]);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                  SizedBox(
                    height: 16,
                  ),
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
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 43, right: 43),
                        child: Text("Add")),
                    onPressed: () {
                      showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return SafeArea(
                              child: AddService(),
                            );
                          });
                    },
                  )),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                      child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      shadowColor:
                          MaterialStatePropertyAll<Color>(Colors.transparent),
                      backgroundColor: services.length != 0
                          ? MaterialStatePropertyAll<Color>(Color(0xff486D98))
                          : MaterialStatePropertyAll<Color>(Colors.transparent),
                    ),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 43, right: 43),
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: services.length != 0
                                  ? Colors.white
                                  : Colors.transparent),
                        )),
                    onPressed: () {
                      if (services.length != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => OrderScreen2())));
                      }
                    },
                  )),
                ]),
          ),
        ));
      })),
    );
  }
}
