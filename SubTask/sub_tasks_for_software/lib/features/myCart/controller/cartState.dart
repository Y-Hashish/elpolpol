// import 'package:frist_pages/features/myCart/view/page/cart_page.dart';




import 'package:frist_pages/features/myCart/view/page/cart_page.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<CartItem> cartItems;

  CartLoaded(this.cartItems);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}