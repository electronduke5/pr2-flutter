import 'package:pr2/domain/entity/role.dart';

import '../../domain/entity/user.dart';

class User extends UserEntity{
  final String password;
  User({
    super.id,
    required super.login,
    required super.idRole,
    required this.password
  });

  Map<String, dynamic> toMap(){
    return{
      'login' : login,
      'password' : password,
      'id_role' : idRole.id,
    };
  }

  factory User.toFromMap(Map<String, dynamic> json){
    return User(
      id: json['id'] as int,
      login: json['login'],
      password: json['password'],
      idRole: RoleEnum.values.firstWhere((element) => element.id == (json['id_role'] as int))
    );
  }

}