import 'package:pr2/domain/entity/category.dart';
import 'package:pr2/domain/entity/product.dart';

class Product extends ProductEntity {
  Product(
      {super.id,
      required super.brand,
      required super.model,
      required super.color,
      required super.price,
      super.countOfSpeed,
      required super.wheelDiameter,
      required super.idProvider,
      required super.yearOfRelease,
      required super.idCategory});

  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'model': model,
      'color': color,
      'price': price,
      'count_of_speed': countOfSpeed,
      'id_provider': idProvider,
      'wheel_diameter': wheelDiameter,
      'year_of_release': yearOfRelease,
      'id_category': idCategory.id,
    };
  }

  factory Product.toFromMap(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        brand: json['brand'],
        model: json['model'],
        color: json['color'],
        price: json['price'] as int,
        idProvider: json['id_provider'] as int,
        countOfSpeed: json['count_of_speed'] as int,
        wheelDiameter: json['wheel_diameter'] as int,
        yearOfRelease: json['year_of_release'] as int,
        idCategory: CategoryEnum.values.firstWhere(
            (category) => category.id == (json['id_category'] as int)));
  }
}
