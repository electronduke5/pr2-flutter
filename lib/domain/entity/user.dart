import 'package:pr2/domain/entity/role.dart';

class UserEntity {
  late int id;
  final String login;
  final String password;
  final RoleEnum idRole;

  UserEntity({
        this.id = 0,
        required this.login,
        this.password = '',
        required this.idRole});
}
