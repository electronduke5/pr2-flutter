import 'package:pr2/domain/entity/status.dart';

class Status extends StatusEntity {
  Status({required super.status});

  Map<String, dynamic> toMap() => {'status': status};

  factory Status.fromToMap(Map<String, dynamic> json) =>
      Status(status: json['status']);
}
