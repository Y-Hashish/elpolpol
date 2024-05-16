import 'package:flutter/cupertino.dart';
import 'package:frist_pages/core/model/product.dart';


abstract class ProductState {}

class ProductInitial extends ProductState {
  final String message;
  ProductInitial({this.message = "Initial state, no products loaded."});
}

class ProductLoading extends ProductState {
  final String message;
  ProductLoading({this.message = "Loading products, please wait..."});
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}


