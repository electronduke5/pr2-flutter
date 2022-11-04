import 'package:pr2/domain/entity/category.dart';

class Category extends CategoryEntity {
  Category({required super.category});

  Map<String, dynamic> toMap() {
    return {
      'category': category,
    };
  }

  factory Category.toFromMap(Map<String, dynamic> json) =>
      Category(category: json['category']);
}
