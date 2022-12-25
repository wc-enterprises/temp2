import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  
 
  
  
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.fromLTRB(20, 60, 10, 20),
    child: Column(
      
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hi, Ameen", style: Theme.of(context).textTheme.headline2,),
        SizedBox(height: 8,),
        Text("Get done your Laundry \nin just 3 steps", style: Theme.of(context).textTheme.headline1,),
              
      ],
    ),
              );
  }
}