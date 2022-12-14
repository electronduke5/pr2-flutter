import 'category.dart';

class ProductEntity {
  late int id;
  final String brand;
  final String model;
  final String color;
  final int wheelDiameter;
  final int yearOfRelease;
  final int countOfSpeed;
  final int price;
  final CategoryEnum idCategory;
  final int idProvider;

  ProductEntity(
      {this.id = 0,
      required this.brand,
      required this.model,
      required this.color,
      required this.wheelDiameter,
      required this.yearOfRelease,
      required this.idProvider,
      required this.price,
      this.countOfSpeed = 1,
      required this.idCategory});
}
