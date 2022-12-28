import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../dummy_data.dart';

class Address_Page extends StatefulWidget {
  const Address_Page({Key? key}) : super(key: key);

  @override
  State<Address_Page> createState() => _Address_PageState();
}

class _Address_PageState extends State<Address_Page> {
  @override
  
  Widget build(BuildContext context) {


    

    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),centerTitle: true,foregroundColor: Theme.of(context).secondaryHeaderColor, title: Text("Your Location"), elevation: 0, backgroundColor: Colors.transparent,),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            AddressButton(name: "+ Add New Address", onPressed: (){
              
                bottomSheet(context);
              
              
            },),
            SizedBox(height: 20,),
            Divider(),
            Padding(padding: EdgeInsets.only(left: 20, bottom: 10),child: Text("Saved Location", style: Theme.of(context).textTheme.headline3,)),
            SavedLocation()
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    List<String> locations = ["Guduvannchery","Urappakkam","Potheri",];
    String ?selectedLocation;
    return showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              
              context: context, 
              
              builder: (context) {
                return StatefulBuilder(builder: (BuildContext context, StateSetter setModalState){
                  return Container(
                height: MediaQuery.of(context).size.height * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                child: Column(
                  
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3B4158),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Select Area", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),),
                          DropdownButton(
                            iconEnabledColor: Colors.white,
                            underline: SizedBox(),
                            iconSize: 15,
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),
                            dropdownColor: Color(0xff3B4158),
                            hint: Text("Select Area", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.white),),
                            borderRadius: BorderRadius.circular(20),
                            value: selectedLocation,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 8,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setModalState(() {
                              selectedLocation = newValue as String?;
              
                              });
                            },
                            items: locations.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),


                        ],
                      ),
                    ),
                    
                    CustomTextField(name: "Door Nnumber *"),   
                    CustomTextField(name: "Street or Apartment Name*"), 
                    CustomTextField(name: "Landmark (Optional)"), 
                    AddAdressTitle(),
                    AddressButton(name: "Save and Continue", onPressed: (){})
                    
                  ],
                ),
              );
                });
                
              
            } );
  }
}

class AddAdressTitle extends StatelessWidget {
  const AddAdressTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.all(20),child: Text("Add Address Title", style: Theme.of(context).textTheme.headline3,)),
        Row(
          children: [
            AddressTitleButton(name: "Home"),
            AddressTitleButton(name: "Work"),
            AddressTitleButton(name: "Other"),

          ],
        )
      ],
    );
  }
}

class AddressTitleButton extends StatelessWidget {
  String name;
  AddressTitleButton({
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
    
       ),
       ),
      onPressed: (){},
      child: Text(
        name,
        style: TextStyle(fontSize: 12),
      ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String name;
  CustomTextField({
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(name, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600, color: Colors.grey),),
          TextField(  
          obscureText: false,  
          decoration: InputDecoration(  
            filled: true,
            fillColor: Color(0xff979AA7),
            focusColor: Color(0xff979AA7),
    
            
            //hintText: 'Ex A14',  
          ),  
                      ),
        ],
      ),
    );
  }
}

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
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){}, //tap function to be added
              child: Row(children: [
                Icon(Icons.place_rounded),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    //Dummy data
                    Text(address[index].addressTitle, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),),
                    Text("${address[index].streetOrAppartmentName}, \n${address[index].doorNumber} \n${address[index].area}", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                    SizedBox(height: 20,),
                  ],
                ),
              ],),
            );
            }, 
          separatorBuilder: (BuildContext context, int index){
            return Divider();
            }, 
          itemCount: address.length,
        ),
      ),
    );
  }
}

class AddressButton extends StatefulWidget {
  String name;
  VoidCallback onPressed;
  
  AddressButton({
    required this.name,
    required this.onPressed
  });

  @override
  State<AddressButton> createState() => _AddressButtonState();
}

class _AddressButtonState extends State<AddressButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50),elevation: 0, backgroundColor: Color(0xff3B4158), shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),), 
        child: Text(widget.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
    );
  }
}
/*
List<String> saved_address = ["Guduvannchery","Urappakkam","Potheri",];
String dropdownValue = saved_address.first;

 DropdownButton(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 0,
                  isExpanded: true,
                  items: saved_address.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(), 
                  onChanged: (String? value) {
                    setState(() {
                    dropdownValue = value!;
                    });
                  },
                ),*/