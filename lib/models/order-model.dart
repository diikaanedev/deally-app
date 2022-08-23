import 'package:deally_app/models/adress-model.dart';
import 'package:deally_app/models/order-item-model.dart';
import 'package:deally_app/models/user-model.dart';

class OrderModel {
  final String id;
  final String name;
  final List<OrderItemModel> order_items;
  final UserModel user;

  const OrderModel(
      {required this.name,
      required this.id,
      required this.order_items,
      required this.user});

  static List<OrderModel> fromJson({required List data}) {
    List<OrderModel> liste = [];

    for (var item in data) {
      liste.add(OrderModel(
        id: item['_id'],
        user: item['client'],
        order_items: OrderItemModel.fromListOrder(data: item['items'] ?? []),
        name: '',
      ));
    }

    return liste;
  }
}
