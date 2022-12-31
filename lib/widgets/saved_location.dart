import 'package:flutter/material.dart';

class SavedLocation extends StatelessWidget {
  const SavedLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
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
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        //Dummy data
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Askhaya Belvedre, 603 \nGuduvanchery",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
            itemCount: 4),
      ),
    );
  }
}
