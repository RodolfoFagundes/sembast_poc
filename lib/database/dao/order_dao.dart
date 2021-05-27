import 'package:sembast/sembast.dart';
import 'package:sembast_poc/database/app_database.dart';
import 'package:sembast_poc/models/order_model.dart';

class OrderDao {
  static const String folderName = 'order';
  final _orderFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future create(Order order) async {
    order.id = await _orderFolder.add(await _db, order.toMap());

    final finder = Finder(filter: Filter.equals('id', order.id));
    await _orderFolder.update(await _db, order.toMap(), finder: finder);
  }

  Future update(Order order) async {
    final finder = Finder(filter: Filter.byKey(order.id));
    await _orderFolder.update(await _db, order.toMap(), finder: finder);
  }

  Future delete(Order order) async {
    final finder = Finder(filter: Filter.byKey(order.id));
    await _orderFolder.delete(await _db, finder: finder);
  }

  Future<List<Order>> readAll() async {
    final recordSnapshot = await _orderFolder.find(await _db);
    return recordSnapshot.map((e) {
      return Order.fromMap(e.value);
    }).toList();
  }
}
