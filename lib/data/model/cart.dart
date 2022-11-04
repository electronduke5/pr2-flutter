import 'package:pr2/domain/entity/cart.dart';

class Cart extends CartEntity {
  Cart({
    super.id,
    required super.count,
    required super.idUser,
    required super.idProduct,
  });

  Map<String, dynamic> toMap() => {
        'count': count,
        'id_user': idUser,
        'id_product': idProduct,
      };

  factory Cart.toFromMap(Map<String, dynamic> json) => Cart(
        id: json['id'] as int,
        count: json['count'] as int,
        idUser: json['id_user'] as int,
        idProduct: json['id_product'] as int,
      );
}
