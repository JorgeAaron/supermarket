import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:supermarket/data/models/product_model.dart';
import 'package:supermarket/data/models/user_model.dart';
import 'package:supermarket/presentation/product_list_complete_page.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(join(await getDatabasesPath(), 'supermarket.db'),
        onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE users (
           email TEXT PRIMARY KEY, name TEXT, lastName TEXT, address TEXT, 
           celNumber INT,  password TEXT
        )  
        ''');
      await db.execute('''
        CREATE TABLE cart (
          id INTEGER PRIMARY KEY, name TEXT, price INTEGER,
        kg DOUBLE, imageUrl TEXT
        )
        ''');
      /*  await db.execute(''' 
        CREATE TABLE order (
          id INTEGER PRIMARY KEY, name TEXT, total TEXT
          )'''); */
    }, version: 1);
  }

  newUser(newUser) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO users (
        email, name, lastName, address, celNumber, password
      ) VALUES (?,?,?,?,?,?)
      ''', [
      newUser.email,
      newUser.name,
      newUser.lastName,
      newUser.address,
      newUser.celNumber,
      newUser.password
    ]);

    return res;
  }

  Future<dynamic> getUser() async {
    final db = await database;
    var res = await db.query("users");
  }

  Future getLogin(String user, String password) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM users WHERE email = '$user' and password = '$password'");
    if (res.length > 0) {
      return new User.fromJson(res.first);
    }
    return print('error');

    ///createCart() async {
    //  await _database.execute(''' ''');
    //}
  }

  insertCart(Product product) async {
    print(await _database.insert("cart", product.toMap()));
  }

  deleteCart(Product product) {
    _database.delete("cart", where: "id = ?", whereArgs: [product.id]);
  }

  Future<List<Product>> getAllproducts() async {
    List<Map<String, dynamic>> results = await _database.query("cart");

    print("Got: ${results.length}");
    return results.map((map) => Product.fromMap(map)).toList();
  }
}
