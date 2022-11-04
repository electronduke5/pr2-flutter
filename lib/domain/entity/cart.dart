class CartEntity {
  late int id;
  final int count;
  final int idUser;
  final int idProduct;

  CartEntity({
    this.id = 0,
    required this.count,
    required this.idUser,
    required this.idProduct,
  });
}
