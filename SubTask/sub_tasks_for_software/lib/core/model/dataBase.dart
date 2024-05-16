// ignore_for_file: constant_identifier_names, unused_local_variable, non_constant_identifier_names

import 'package:frist_pages/core/model/favorite.dart';
import 'package:frist_pages/core/model/product.dart';
import 'package:frist_pages/core/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHandler {
  static Database? _db;

  static const String dbname = "proj.db";
  static const int version = 1;

  // Table names
  static const String users_table = "users";
  static const String products_table = "products";
  static const String favorites_table = "favorites";
  static const String shopping_table = "shopping";
  static const String shopping_items_table = "shopping_items";

  // Column names for users table
  static const String user_id = "user_id";
  static const String user_name = "user_name";
  static const String password = "password";
  static const String email = "email";
  static const String phone = "phone";
  static const String address = "address";

  // Column names for products table
  static const String product_id = "product_id";
  static const String product_name = "product_name";
  static const String description = "description";
  static const String category = "category";
  static const String price = "price";
  static const String isFeatured = "isFeatured";
  static const String image = "image";

  // Column names for favorites table
  static const String favorite_id = "favorite_id";
  static const String favorites_user_id_fk = "user_id";
  static const String favorites_product_id_fk = "product_id";

  // Column names for shopping table
  static const String shopping_id = "shopping_id";
  static const String user_id_fk = "user_id";
  static const String isOrdard = "isOrdered"; //0
  static const String dateOrdered = "dateOrdered";
  static const String shippingAddress = "shippingAddress";
  static const String totalPrice = "totalPrice";
  static const String isFinished = "isFinished"; //0

  // Column names for shopping_items table
  static const String shopping_items_id = "shopping_items_id";
  static const String shopping_id_fk = "shopping_id";
  static const String product_id_fk = "product_id";
  static const String quantity = "quantity";

  Future<Database?> get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), dbname);
      _db = await openDatabase(path,
          version: version, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
    return _db;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), dbname);
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        // Create your tables here
      },
      version: 1,
    );
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $users_table (
        $user_id INTEGER PRIMARY KEY,
        $user_name TEXT,
        $password TEXT,
        $email TEXT,
        $phone TEXT,
        $address TEXT,
        UNIQUE($email)
      )
    ''');

    await db.execute('''
      CREATE TABLE $products_table (
        $product_id INTEGER PRIMARY KEY,
        $product_name TEXT,
        $description TEXT,
        $category TEXT,
        $price REAL,
        $isFeatured INTEGER,
        $image TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE $favorites_table (
        $favorite_id INTEGER PRIMARY KEY,
        $favorites_user_id_fk INTEGER,
        $favorites_product_id_fk INTEGER,
        FOREIGN KEY ($favorites_user_id_fk) REFERENCES $users_table($user_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY ($favorites_product_id_fk) REFERENCES $products_table($product_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE $shopping_table (
        $shopping_id INTEGER PRIMARY KEY,
        $user_id_fk INTEGER,
        $isOrdard INTEGER DEFAULT 0,
        $shippingAddress TEXT,
        $totalPrice REAL,
        $isFinished INTEGER DEFAULT 0,
        FOREIGN KEY ($user_id_fk) REFERENCES $users_table($user_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
      )
    ''');

    await db.execute('''
      CREATE TABLE $shopping_items_table (
        $shopping_items_id INTEGER PRIMARY KEY,
        $shopping_id_fk INTEGER,
        $product_id_fk INTEGER,
        $quantity INTEGER,
        FOREIGN KEY ($shopping_id_fk) REFERENCES $shopping_table($shopping_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY ($product_id_fk) REFERENCES $products_table($product_id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
      )
    ''');
    await db.execute('''
    INSERT INTO $products_table ($product_name, $description, $category, $price, $isFeatured, $image)
    VALUES (
    1, 'Ratatouille', 'kosa batengan and potato', 'Appetizers', 69.99, 1, 'assets/images/p2.jpg')
  ''');
  }

  _onUpgrade(Database db, int oldversion, int newversion) async {}

  ///////////////////// user functions ////////////////////////////
  Future<User> signUp(User user) async {
    Database? dbc = await db;
    int id = await dbc!.insert(users_table, {
      'user_id': user.id,
      'user_name': user.name,
      'password': user.password,
      'email': user.email,
      'phone': user.phone,
      'address': user.address
    });
    user.id = id;
    return user;
  }

  Future<bool> login(String email, String password) async {
    final db = await this.db;
    final List<Map<String, dynamic>> result = await db!.query(
      'users_table',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  Future<void> deleteUser(int userId) async {
    Database? dbc = await db;
    await dbc!.delete(
      users_table,
      where: '$user_id = ?',
      whereArgs: [userId],
    );
  }

  Future<List<User>> allUsers() async {
    Database? d = await db;
    List<Map> data = await d!.query(users_table);

    List<User> users = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        Map item = data[i];
        User u = User(item['user_id'], item['user_name'], item['password'],
            item['email'], item['phone'], item['address']);
        users.add(u);
      }
    }
    return users;
  }

  ///////////////////////////// product function //////////////////////////////////
  //add ,, get in category ,, get isFeatured ,, get all

  Future<void> deleteProduct(String test) async {
    Database? dbc = await db;
    await dbc!.delete(
      products_table,
      where: '$description = ?',
      whereArgs: [test],
    );
  }

  Future<Product> addProduct(Product p) async {
    Database? dbc = await db;
    int id = await dbc!.insert(products_table, {
      'product_id': p.id,
      'product_name': p.name,
      'description': p.description,
      'category': p.category,
      'price': p.price,
      'isFeatured': p.isFeatured,
      'image': p.image
    });
    p.id = id;
    return p;
  }

  Future<List<Product>> categoryProducts(String categoryName) async {
    Database? d = await db;
    List<Map> data = await d!.query(
      products_table,
      where: '$category = ?',
      whereArgs: [categoryName],
    );

    List<Product> products = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        Map item = data[i];
        Product p = Product(
            item['product_id'],
            item['product_name'],
            item['description'],
            item['category'],
            item['price'],
            item['isFeatured'],
            item['image']);
        products.add(p);
      }
    }
    return products;
  }

  Future<List<Product>> featuredProducts(int featured) async {
    Database? d = await db;
    List<Map> data = await d!.query(
      products_table,
      where: '$isFeatured = ?',
      whereArgs: [featured],
    );

    List<Product> products = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        Map item = data[i];
        Product p = Product(
            item['product_id'],
            item['product_name'],
            item['description'],
            item['category'],
            item['price'],
            item['isFeatured'],
            item['image']);
        products.add(p);
      }
    }
    return products;
  }

  Future<List<Product>> allProducts() async {
    Database? d = await db;
    List<Map> data = await d!.query(products_table);

    List<Product> products = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        Map item = data[i];
        Product p = Product(
            item['product_id'],
            item['product_name'],
            item['description'],
            item['category'],
            item['price'],
            item['isFeatured'],
            item['image']);
        products.add(p);
      }
    }
    return products;
  }

//////////////////////////////// user's favorites ///////////////////////////////////////
//add , delete , select user favorites
  Future<Favorite> addToFavorites(Favorite f) async {
    Database? dbc = await db;
    int id = await dbc!.insert(favorites_table, {
      'favorite_id': f.id,
      'user_id': f.u_id,
      'product_id': f.p_id,
    });
    f.id = id;
    return f;
  }

  Future<void> daleteFromFavorites(int userId, int productId) async {
    Database? dbc = await db;
    await dbc!.delete(
      favorites_table,
      where: '$favorites_user_id_fk = ?  AND  $favorites_product_id_fk=? ',
      whereArgs: [userId, productId],
    );
  }

  Future<List<Product>> userFavorites(int userId) async {
    Database? d = await db;
    List<Map> data = await d!.query(
      favorites_table,
      where: '$favorites_user_id_fk = ?',
      whereArgs: [userId],
    );

    List<Product> favoriteProducts = [];

    for (var item in data) {
      int productId = item[favorites_product_id_fk];
      List<Map> productData = await d.query(
        products_table,
        where: '$product_id = ?',
        whereArgs: [productId],
      );

      if (productData.isNotEmpty) {
        Map productItem = productData.first;
        Product p = Product(
            item['product_id'],
            item['product_name'],
            item['description'],
            item['category'],
            item['price'],
            item['isFeatured'],
            item['image']);
        favoriteProducts.add(p);
      }
    }

    return favoriteProducts;
  }

  Future<List<Favorite>> testAlluserFavorites(int userId) async {
    Database? d = await db;
    List<Map> data = await d!.query(
      favorites_table,
      where: '$favorites_user_id_fk= ?',
      whereArgs: [userId],
    );

    List<Favorite> Favorites = [];
    if (data.isNotEmpty) {
      for (var i = 0; i < data.length; i++) {
        Map item = data[i];
        Favorite f = Favorite(
          item['favorite_id'],
          item['user_id'],
          item['product_id'],
        );
        Favorites.add(f);
      }
    }
    return Favorites;
  }

  Future<int> insertUser(User user) async {
    final db = await this.db;
    return await db!.insert(users_table, user.toMap());
  }

/*


///////////////////////////////////// shoping table ///////////////////////////////////////////
//order(updata: isOrderd=1 , total price , shiping address ) ,, 
Future<>







//////////////////////////////////// shopping_items table /////////////////////////////////////////
//addTocart(insert) , deleteFromcart(delete) , changeQuantity(update quantity)

Future<ShoppingItem>addShoppingItem(ShoppingItem item) async {
    Database? d = await db;
    int id=await d!.insert(shopping_items_table, { 'shopping_items_id':item.id , 'shopping_id':item.shoppingId , 
    'product_id':item.productId ,'quantity':item.quantity});
    item.id=id;
    return item;
  }

Future<void> deleteShoppingItem(int itemId) async {
     Database? d = await db;
      await d!.delete('shopping_items',where: 'shopping_items_id = ?', whereArgs: [itemId],);
  }

  
Future<int> incrementShoppingItemQuantity(int itemId) async {
     Database? d = await db;
     Map<String, dynamic> item = (await d!.query('shopping_items',columns: ['quantity'],
      where: 'shopping_items_id = ?',whereArgs: [itemId], )) as Map<String, dynamic>;

  
     int currentQuantity = item['quantity'];
     int newQuantity = currentQuantity + 1;


      return await d!.update('shopping_items',{'quantity': newQuantity},
        where: 'shopping_items_id = ?',
        whereArgs: [itemId],);
  }

  
Future<int> decrementShoppingItemQuantity(int itemId) async {
     Database? d = await db;
     Map<String, dynamic> item = (await d!.query('shopping_items',columns: ['quantity'],
      where: 'shopping_items_id = ?',whereArgs: [itemId], )) as Map<String, dynamic>;

  
     int currentQuantity = item['quantity'];
     int newQuantity = currentQuantity - 1;


      return await d!.update('shopping_items',{'quantity': newQuantity},
        where: 'shopping_items_id = ?',
        whereArgs: [itemId],);
  }
*/
}
