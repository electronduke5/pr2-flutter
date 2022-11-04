abstract class DatabaseRequest{
  static const String tableRole = 'role';
  static const String tableUsers = 'user';
  static const String tableCategory = 'category';
  static const String tableProduct = 'product';
  static const String tableCart = 'cart';
  static const String tableStatus = 'status';
  static const String tableOrder = 'order';
  static const String tableItemOrder = 'item_order';
  static const String tableProvider = 'provider';

  static String deleteTable(String table) => 'DROP TABLE $table';

  static const List<String> tableList = [
    tableRole,
    tableUsers,
    tableCategory,
    tableProvider,
    tableProduct,
    tableCart,
    tableStatus,
    tableOrder,
    tableItemOrder,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUsers,
    _createTableCategory,
    _createTableProvider,
    _createTableProduct,
    _createTableCart,
    _createTableStatus,
    _createTableOrder,
    _createTableItemOrder,
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
      '"id_provider" INTEGER,'
      'FOREIGN KEY("id_provider") REFERENCES "Provider"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT),'
      '"id_category"	INTEGER,'
      'FOREIGN KEY("id_category") REFERENCES "Category"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  /// Запрос для создания таблицы Product
  static const String _createTableCart =
      'CREATE TABLE "$tableCart" ('
      '"id"	INTEGER,'
      '"count"	INTEGER NOT NULL,'
      '"id_user" INTEGER,'
      'FOREIGN KEY("id_user") REFERENCES "User"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT),'
      '"id_product" INTEGER,'
      'FOREIGN KEY("id_product") REFERENCES "Product"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableStatus =
      'CREATE TABLE "$tableStatus" ("id" INTEGER,"status" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableOrder =
      'CREATE TABLE "$tableOrder" ('
      '"id"	INTEGER,'
      '"date_order"	TEXT NOT NULL,'
      '"id_user" INTEGER,'
      'FOREIGN KEY("id_user") REFERENCES "User"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT),'
      '"id_status" INTEGER,'
      'FOREIGN KEY("id_status") REFERENCES "Status"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableItemOrder =
      'CREATE TABLE "$tableItemOrder" ('
      '"id"	INTEGER,'
      '"count" INTEGER NOT NULL,'
      '"id_order" INTEGER,'
      'FOREIGN KEY("id_order") REFERENCES "Order"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT),'
      '"id_product" INTEGER,'
      'FOREIGN KEY("id_product") REFERENCES "Product"("id") ON DELETE CASCADE,PRIMARY KEY("id" AUTOINCREMENT) )';

  static const String _createTableProvider =
      'CREATE TABLE "$tableProvider" ("id"	INTEGER,"name"	TEXT NOT NULL, PRIMARY KEY("id" AUTOINCREMENT) )';
}