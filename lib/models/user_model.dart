import 'address_model.dart';

class UserModel {
  String? id;
  String? name;
  String? phoneNumber;
  late List<String>? location; //(lattitude,longitude)
  late List<Address>? address;
  UserModel(
      {this.id, this.name, this.address, this.location, this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "id": id,
      "location": location,
      "address": getAddress(address),
    };
  }

  List<Map<String, dynamic>> getAddress(List<Address>? address) {
    List<Map<String, dynamic>> userAddress = [];
    for (var i = 0; i < address!.length; i++) {
      userAddress.add(address[i].toJson());
    }
    return userAddress;
  }
}
//address?.map((e) => e.toJson()),
