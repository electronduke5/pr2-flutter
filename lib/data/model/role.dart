import '../../domain/entity/role.dart';

class Role extends RoleEntity {
  Role({required super.role});

  Map<String, dynamic> toMap() {
    return {
      'role': role,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) => Role(role: json['role']);
}
