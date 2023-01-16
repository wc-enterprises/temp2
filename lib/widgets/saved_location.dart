import 'package:flutter/material.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';

class SavedLocation extends StatelessWidget {
  SavedLocation({
    Key? key,
  }) : super(key: key);
  final service = IsarService();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: service.getAllAddress(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {}, //tap function to be added
                        child: Row(
                          children: [
                            Icon(Icons.place_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                //Dummy data
                                Text(
                                  snapshot.data![index].addressTitle,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "${snapshot.data![index].doorNumber}, ${snapshot.data![index].street}\n${snapshot.data![index].area}, ${snapshot.data![index].district}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                                onTap: () {
                                  service.deleteAddress(
                                      snapshot.data?[index].addressId);
                                },
                                child: Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: snapshot.data!.length),
              );
            }
            if (snapshot.data?.length == 0) {
              Text(
                "No address to show",
                style: Theme.of(context).textTheme.headline3,
              );
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
