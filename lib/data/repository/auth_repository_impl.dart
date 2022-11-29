import 'package:dartz/dartz.dart';
import 'package:pr2/common/database_request.dart';
import 'package:pr2/core/db/database_helper.dart';
import 'package:pr2/data/model/user.dart';
import 'package:pr2/domain/entity/role.dart';
import 'package:pr2/domain/repository/auth_repositories.dart';
import 'package:sqflite/sqflite.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthRepositoryImpl implements AuthRepositories {
  final _db = DatabaseHelper.instance.database;
  String table = DatabaseRequest.tableUsers;

  @override
  Future<Either<String, RoleEnum>> singIn(String login, String password) async {
    try {
      var user = await _db.query(
        table,
        where: 'login = ?',
        whereArgs: [login],
      );

      if (user.isEmpty) {
        return const Left('Такого пользователя нет');
      }
      if (user.first['password'] != sha1.convert(utf8.encode(password)).toString()) {
        return const Left('Неправильный пароль');
      }

      return Right(RoleEnum.values
          .firstWhere((element) => element.id == user.first['id_role']));
    } on DatabaseException catch (error) {
      return const Left('Ошибка базы данных');
    }
  }

  @override
  Future<Either<String, bool>> singUp(String login, String password) async {
    try{
      _db.insert(table, User(login: login, idRole: RoleEnum.user, password: password).toMap());
      return const Right(true);
    } on DatabaseException catch (error){
      return const Left('Ошибка базы данных');
    }
  }
}
