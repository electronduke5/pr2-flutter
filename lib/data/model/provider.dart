import 'package:pr2/domain/entity/provider.dart';

class Provider extends ProviderEntity {
  Provider({
    super.id,
    required super.name,
  });

  Map<String, dynamic> toMap() => {'name': name};

  factory Provider.fromToMap(Map<String, dynamic> json) => Provider(
        id: json['id'] as int,
        name: json['name'],
      );
}
