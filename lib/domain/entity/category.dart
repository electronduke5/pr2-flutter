class CategoryEntity {
  late int id;
  final String category;

  CategoryEntity({required this.category});
}

enum CategoryEnum {
  mountain(id: 1, name: 'Горные'),
  kids(id: 2, name: 'Детские'),
  teen(id: 3, name: 'Подростковые'),
  electric(id: 4, name: 'Электровелосипеды'),
  road(id: 5, name: 'Дорожные'),
  extreme(id: 6, name: 'Экстрим'),
  city(id: 7, name: 'Городские'),
  folding(id: 8, name: 'Складные'),
  speed(id: 9, name: 'Скоростные');

  final int id;
  final String name;

  const CategoryEnum({
    required this.id,
    required this.name,
  });
}
