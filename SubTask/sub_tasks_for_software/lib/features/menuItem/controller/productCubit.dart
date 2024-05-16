import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/model/dataBase.dart';
import 'package:frist_pages/core/model/product.dart';
import 'productState.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'productState.dart';
const String products_table = 'products'; // Define products_table here


class ProductCubit extends Cubit<ProductState> {
  final DataBaseHandler _dataBaseHandler = DataBaseHandler();

  ProductCubit() : super(ProductInitial());

  Future<void> fetchAllProducts() async {
    emit(ProductLoading());
    List<Product> allProducts = [];
    allProducts.addAll(await fetchProductsByCategory('Appetizers'));
    allProducts.addAll(await fetchProductsByCategory('Main Courses'));
    allProducts.addAll(await fetchProductsByCategory('desserts'));
    emit(ProductLoaded(allProducts));
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final List<Product> products = await categoryProducts(category);
    return products;
  }

  Future<List<Product>> categoryProducts(String categoryName) async {
    final Database? db = await _dataBaseHandler.db;
    List<Map> data = await db!.query(products_table, where: 'category = ?', whereArgs: [categoryName]);

    List<Product> products = [];
    if (data.isNotEmpty) {
      for (var item in data) {
        Product p = Product(
            item['product_id'],
            item['product_name'],
            item['description'],
            item['category'],
            item['price'],
            item['isFeatured'],
            item['image']
        );
        products.add(p);
      }
    }
    return products;
  }
}