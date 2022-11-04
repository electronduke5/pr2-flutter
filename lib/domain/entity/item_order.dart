class ItemOrderEntity {
  late int id;
  final int count;
  final int idOrder;
  final int idProduct;

  ItemOrderEntity({
    this.id = 0,
    required this.count,
    required this.idOrder,
    required this.idProduct,
  });
}
