abstract class DatabaseRequest{
  static const String tableRole = 'role';
  static const String tableUsers = 'user';
  static const String tableCategory = 'category';
  static const String tableProduct = 'product';
  static const String tableCart = 'cart';
  //TODO: Еще 5 таблиц

  static String deleteTable(String table) => 'DROP TABLE $table';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableCategory,
    tableProduct,
    tableCart,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableCategory,
    _createTableProduct,
    _createTableCart,
  ];

  /// Запрос для создания таблицы Role
  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Users
  static const String _createTableUsers =
      'CREATE TABLE "$tableUsers" ("id"	INTEGER,"login"	TEXT NOT NULL UNIQUE,"password"	TEXT NOT NULL,"id_role"	INTEGER,FOREIGN KEY("id_role") REFERENCES "Role"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы Category
  static const String _createTableCategory =
      'CREATE TABLE "$tableCategory" ("id" INTEGER,"category" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  /// Запрос для создания таблицы Product
  static const String _createTableProduct =
      'CREATE TABLE "$tableProduct" ('
      '"id"	INTEGER,'
      '"brand"	TEXT NOT NULL, '
      '"model"	TEXT NOT NULL, '
      '"color"	TEXT NOT NULL, '
      '"price"	INTEGER NOT NULL, '
      '"count_of_speed"	INTEGER NOT NULL, '
      '"wheel_diameter"	INTEGER NOT NULL, '
      '"year_of_release" INTEGER NOT NULL, '
      '"id_category"	INTEGER,'
      'FOREIGN KEY("id_category") REFERENCES "Category"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы Product
  static const String _createTableCart =
      'CREATE TABLE "$tableCart" ('
      '"id"	INTEGER,'
      '"count"	INTEGER NOT NULL,'
      '"id_user" INTEGER,'
      'FOREIGN KEY("id_user") REFERENCES "User"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT)'
      '"id_product" INTEGER,'
      'FOREIGN KEY("id_product") REFERENCES "Product"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';
}