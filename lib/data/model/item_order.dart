import 'package:pr2/domain/entity/item_order.dart';

class ItemOrder extends ItemOrderEntity {
  ItemOrder({
    super.id,
    required super.count,
    required super.idOrder,
    required super.idProduct,
  });

  Map<String, dynamic> toMap() =>
      {'count': count, 'id_order': idOrder, 'id_product': idProduct};

  factory ItemOrder.fromToMap(Map<String, dynamic> json) => ItemOrder(
      id: json['id'] as int,
      count: json['count'] as int,
      idOrder: json['id_order'] as int,
      idProduct: json['id_product'] as int);
}
