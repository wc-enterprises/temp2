import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row( //header
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextButton(onPressed: (){}, child: const Text("Home", style: TextStyle(color: Colors.black, decoration: TextDecoration.underline)),),
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
                    SizedBox(width: 5,),
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