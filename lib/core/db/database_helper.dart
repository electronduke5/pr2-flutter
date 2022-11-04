import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pr2/common/database_request.dart';
import 'package:pr2/domain/entity/role.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sql.dart' as sqflite_common;

import '../../data/model/role.dart';
import '../../data/model/user.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  DatabaseHelper._instance();

  final int _version = 1;
  late final String _pathDB;
  late final Directory _appDocumentDirectory;
  late final Database database;

  Future<void> init() async {
    _appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    _pathDB = join(_appDocumentDirectory.path, 'VeloShopDB.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      //TODO:Строка подключеняи к бд
    } else {
      database = await openDatabase(_pathDB,
          version: _version, onCreate: (db, version) {});
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var tableCreateString in DatabaseRequest.tableCreateList) {
      await db.execute(tableCreateString);
    }
  }

  Future<void> onInitTable(Database db) async{
    try{

      for(var element in RoleEnum.values){
        db.insert(DatabaseRequest.tableRole, Role(role:element.name).toMap());
      }

      db.insert(DatabaseRequest.tableUsers, User(
        login: 'admin',
        password: 'admin',
        idRole: RoleEnum.admin,
      ).toMap());

    } on DatabaseException catch (error){
      print(error.result);
    }
  }

  Future<void> onUpdateTable(Database db) async {
    var tables = await db.rawQuery('Select name from sqlite_master');
    for(var table in DatabaseRequest.tableList.reversed){
      if(tables.where((element) => element['name'] == table).isNotEmpty){
        await db.execute(DatabaseRequest.deleteTable(table));
      }
    }

    await onCreateTable(db);
  }

  Future<void> onDropDatabase() async{
    database.close();

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      //TODO:Строка удаления бд
    } else {
      deleteDatabase(_pathDB);
    }
  }
}
