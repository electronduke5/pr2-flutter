abstract class DatabaseRequest{
  static const String tableRole = 'role';
  static const String tableUsers = 'user';
  static const String tableCategory = 'category';
  //TODO: Еще 6 таблиц

  static String deleteTable(String table) => 'DROP TABLE $table';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableCategory,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableCategory,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы Category
  static const String _createTableCategory =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"category" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';
}