import 'service_model.dart';
import 'address_model.dart';

class Order {
  String id;
  String? userName;
  String pickTimeSlot;
  String deliveryTimeSlot;
  Address pickUpAddress;
  Address deliveryAddress;
  String? phoneNumber;
  Status? status;
  double? deliveryFee;
  List<Service> selectedService;
  List<Map<Service, double>>?
      serviceAmount; //service charge per kg/piece * quantity(number of piece or number of kg)
  late double totalServiceAmount;
  late double totalAmount;
  late double tax;
  Order(
      {required this.id,
      this.userName,
      required this.pickTimeSlot,
      required this.deliveryTimeSlot,
      required this.pickUpAddress,
      required this.deliveryAddress,
      this.serviceAmount,
      this.phoneNumber,
      this.status,
      this.deliveryFee,
      required this.selectedService,
      required this.totalAmount,
      required this.tax});
}

enum Status { waitingForConfirmation, orderPlaced, outForDelivery, delivered }
