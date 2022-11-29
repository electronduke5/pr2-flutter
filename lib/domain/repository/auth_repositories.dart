import 'package:dartz/dartz.dart';
import 'package:pr2/domain/entity/role.dart';

abstract class AuthRepositories {

  Future<Either<String, RoleEnum>> singIn(String login, String password);
  Future<Either<String, bool>> singUp(String login, String password, );
}
