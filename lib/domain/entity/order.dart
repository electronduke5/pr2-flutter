import 'package:pr2/domain/entity/status.dart';

class OrderEntity {
  late int id;
  final DateTime dateOrder;
  final int idUser;
  final StatusEnum idStatus;

  OrderEntity({
    this.id = 0,
    required this.dateOrder,
    required this.idUser,
    required this.idStatus,
  });
}
