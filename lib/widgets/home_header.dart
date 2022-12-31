import 'package:flutter/material.dart';
import 'package:laundry_app/screens/address_screen/address_screen.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        //header
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => Address_Page())));
            },
            child: Container(
                child: Row(
              children: [
                const Text("Home",
                    style: TextStyle(
                      color: Colors.black,
                    )),
                Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black),
              ],
            )),
          ),
          const Spacer(),
          CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    size: 16,
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ))),
          SizedBox(
            width: 5,
          ),
          CircleAvatar(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }
}
