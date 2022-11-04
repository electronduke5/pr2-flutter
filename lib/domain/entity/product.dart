import 'category.dart';

class ProductEntity {
  late int id;
  final String brand;
  final String model;
  final String color;
  final int wheelDiameter;
  final int yearOfRelease;
  final int countOfSpeed;
  final CategoryEnum idCategory;

  ProductEntity(
      {this.id = 0,
      required this.brand,
      required this.model,
      required this.color,
      required this.wheelDiameter,
      required this.yearOfRelease,
      this.countOfSpeed = 1,
      required this.idCategory});
}
