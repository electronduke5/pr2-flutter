class StatusEntity{
  late int id;
  final String status;

  StatusEntity({required this.status});
}

enum StatusEnum{
  processing(id:1, name: 'В обработке'),
  assembly(id: 2, name: 'Сборка'),
  shipped(id: 3, name: 'Отгружен'),
  transit(id: 4, name: 'В пути в сортировочный центр'),
  arrived(id: 5, name: 'Готов к получению');

  final int id;
  final String name;

  const StatusEnum({
    required this.id,
    required this.name,
});

}