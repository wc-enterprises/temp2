import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/widgets/home_basket.dart';

import '../../models/order_model.dart';
import '../../widgets/home_header.dart';
import '../../widgets/home_name_slogan.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../widgets/home_offer_card.dart';
import '../../widgets/home_pricechart.dart';
import '../../widgets/home_steps_image.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Address dropdownValue = address[0];
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Header(), //Header Widget has location, new basket and settings
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              
                  HomeTitle(), //HomeTitle Widget includes user greeting and a slogan

                  Basket(), //Basket Widget has Add new basket and Previous order card list

                  PriceChart(), //PriceChart Widget has a PageView with list of prices, It's horizontal scrollable with indicator 
                  
                  StepsImage(), //StepsImage Widget has List of horizontal scrollable images
                  
                  OfferCard(), //OfferCard Widget has List of horizontal scrollable cards
                  
                  // just a bottom line
                  Container(  
                    height: 30,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  
                ]),
              
          
            ],
          ),
        ),
      ), 
    );
    
  }
}
