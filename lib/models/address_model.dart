import 'package:isar/isar.dart';
part 'address_model.g.dart';

@Collection()
class Address {
  Id? id;
  @Index(unique: true, replace: true)
  String? addressId;
  String addressTitle;
  String doorNumber;
  String? street;
  String area;
  String? district;
  String? pincode;
  String? landmark;
  Address(
      {required this.addressTitle,
      required this.doorNumber,
      required this.street,
      required this.area,
      this.landmark,
      this.district,
      this.pincode,
      this.addressId});

  Map<String, dynamic> toJson() {
    return {
      'addressTitle': addressTitle,
      'doorNumber': doorNumber,
      'street': street,
      'area': area,
      'landMark': landmark,
      'district': district,
      'pincode': pincode,
    };
  }
}


//addressId doorNumber+StreetName 
