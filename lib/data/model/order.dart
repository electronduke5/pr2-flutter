import 'package:pr2/domain/entity/order.dart';
import 'package:pr2/domain/entity/status.dart';

class Order extends OrderEntity {
  Order({
    super.id,
    required super.dateOrder,
    required super.idUser,
    required super.idStatus,
  });

  Map<String, dynamic> toMap() =>
      {'date_order': dateOrder, 'id_user': idUser, 'id_status': idStatus.id};

  factory Order.toFromMap(Map<String, dynamic> json) => Order(
      id: json['id'] as int,
      dateOrder: json['date_order'] as DateTime,
      idUser: json['id_user'] as int,
      idStatus: StatusEnum.values
          .firstWhere((status) => status.id == (json['id_status'] as int)));
}
