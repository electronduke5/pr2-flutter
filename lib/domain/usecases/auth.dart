import 'package:dartz/dartz.dart';
import 'package:pr2/core/usecases/auth_user_case.dart';
import 'package:pr2/domain/entity/role.dart';
import 'package:pr2/domain/repository/auth_repositories.dart';

class Auth implements AuthUserCase<String, AuthParams> {
  final AuthRepositories _authRepositories;

  Auth(this._authRepositories);

  @override
  Future<Either<String, RoleEnum>> signIn(AuthParams params) async {
    return await _authRepositories.singIn(params.login, params.password);
  }

  @override
  Future<Either<String, bool>> signUp(AuthParams params) async {
    return await _authRepositories.singUp(params.login, params.password);
  }
}

class AuthParams {
  String login;
  String password;

  AuthParams({required this.login, required this.password});
}
