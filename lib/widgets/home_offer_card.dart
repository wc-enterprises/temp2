import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Offers and more", style: Theme.of(context).textTheme.headline3,),
          SizedBox(height: 20,),
          SizedBox(
            height: 115,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4, 
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 112,
                  width: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                  child: Center(child: Text("Dummy Card")),
                );
              }, 
              separatorBuilder: (BuildContext context, int index){
                return SizedBox(width: 10);
              }, ),
          ),
          
        ],),
    );
  }
}