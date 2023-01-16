import 'package:isar/isar.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/order_model.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }
  Future<Isar> openIsar() async {
    print("isar initialised");
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [AddressSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  addAddress(Address address) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.address.put(address);
    });
    print("address added");
  }

  Stream<List<Address>> getAllAddress() async* {
    final isar = await db;

    Stream<List<Address>> allAddress = await isar.address
        .where()
        .filter()
        .idGreaterThan(0)
        .watch(fireImmediately: true);
    yield* allAddress;
  }

  Future<List<Address>> futureAddress() async {
    final isar = await db;
    List<Address> allAddress = await isar.address.where().findAll();
    return allAddress;
  }

  deleteAddress(id) async {
    final isar = await db;

    await isar.writeTxn(() async {
      final count =
          await isar.address.filter().addressIdEqualTo(id).deleteAll();
      print('Address deleted');
    });
  }
}
