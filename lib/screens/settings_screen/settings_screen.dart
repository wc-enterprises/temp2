import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List <SettingsItem> settings = [
      SettingsItem(itemName: "Profile", onTap: (){}),
      SettingsItem(itemName: "FAQ", onTap: (){}),
      SettingsItem(itemName: "Policy", onTap: (){}),
      SettingsItem(itemName: "Contact", onTap: (){}),
      SettingsItem(itemName: "Notification", onTap: (){}),
    ];
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: <Widget>[

            //Back button and Settings Title in Custom Decorated Container
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                  color: Color(0xff212427),
                ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(icon: Icon(Icons.arrow_back_rounded), alignment: Alignment.topLeft ,color: Colors.white, onPressed: () => Navigator.pop(context),),
                  Padding(padding: EdgeInsets.all(10),child: Text("Settings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),))
                ],
              ),
            )),

            //List of Settings item, coming from settings[].
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                     scrollDirection: Axis.vertical,
                     physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index){
                      return settings[index];
                    }, 
                    separatorBuilder: (BuildContext context, index)  {return Divider();}, 
                    itemCount: settings.length,
                  ),
                ),
              )),
              
              //Logout Button
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextButton(
                      onPressed: (){}, //Add logout function here
                      child: Text("Log Out", style: TextStyle(fontSize: 18, color: Colors.redAccent,),),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(),
                      ),
                    ),
                    Text("App version 0.001 \nWashly Pvt", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200, color: Colors.grey[800]), textAlign: TextAlign.center,)
                  ],
                ))
          ],
        ),
      )
    );
  }
}


class SettingsItem extends StatelessWidget {
  
  String itemName;
  Function onTap;
  SettingsItem({
    Key? key,
    required this.itemName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Text(itemName, style: Theme.of(context).textTheme.bodyLarge,),
            Spacer(),
            Icon(Icons.arrow_forward_ios_outlined, size: 10,),
          ],
        ),
        
      ),
    );
  }
}