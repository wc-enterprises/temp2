import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen1.dart';

class Basket extends StatelessWidget {
  const Basket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

   

    return Column(
      children: [

        // view all text button
        Align(alignment: Alignment.centerRight,child: TextButton(onPressed: (){}, child: const Text("view all", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, decoration: TextDecoration.underline, color: Colors.black),))),
        
        //Horizontal Scrollable cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
          
            children: const <Widget>[
              SizedBox(width: 20,),
              AddBasketCard(), //New basket adding card

              SizedBox(width: 10,),
              OrderCard() //Previous orders card list
            ],
          ),
        ),
      ],
    );
  }
}







class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {

     //dummy data
    List<String> order = ["Laundry in process Thanks for waiting", "Out for delivery", "Deelivered", "Delivered"];

    return SizedBox(
      height: 140,
      child: ListView.separated(itemCount: order.length, scrollDirection: Axis.horizontal, shrinkWrap: true, 
        itemBuilder: (BuildContext context, int index){
          return Container(width: 180, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white), 
                 padding: EdgeInsets.all(20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(onPressed: (){}, child: Text("Review", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),), style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.grey[200], shape: const StadiumBorder(),),),
                    const Spacer(),
                    Text(order[index], style: TextStyle(fontSize: 12),),
                  ],
                 ));
      }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(width: 10); }, ),
    );
  }
}





class AddBasketCard extends StatelessWidget {
  const AddBasketCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [5, 5],
        color: Colors.grey,
        strokeWidth: 2,
        child: Container(
          height: 140,
          width: 130,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor, // background
                  foregroundColor: Colors.black, // foreground
                  shape: const StadiumBorder(),
                ),
                onPressed: (){},
                child: const Text("Add Basket", style: TextStyle( fontSize: 12, fontWeight: FontWeight.w600),),
        
              ),
              const Spacer(),
              const Text("Start your \nlaundry by \nadding basket", style: TextStyle(fontSize: 14),),
            ],
          ),
          
        )
      ),
    );
  }
}