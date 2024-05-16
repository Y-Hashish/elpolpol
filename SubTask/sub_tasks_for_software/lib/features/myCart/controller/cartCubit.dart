// cart_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/model/product.dart';
import 'package:frist_pages/features/myCart/view/page/cart_page.dart';
import 'cartState.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void addToCart(Product product) {
    if (state is CartLoaded) {
      final List<CartItem> updatedCart = List.from((state as CartLoaded).cartItems);
      final int index = updatedCart.indexWhere((item) => item.product.id == product.id);

      if (index != -1) {
        updatedCart[index] = CartItem(product: product, quantity: updatedCart[index].quantity + 1);
      } else {
        updatedCart.add(CartItem(product: product, quantity: 1));
      }
      emit(CartLoaded(updatedCart));
    } else {
      emit(CartLoaded([CartItem(product: product, quantity: 1)]));
    }
  }

  void removeFromCart(Product product) {
    if (state is CartLoaded) {
      final List<CartItem> updatedCart = List.from((state as CartLoaded).cartItems);
      updatedCart.removeWhere((item) => item.product.id == product.id);
      emit(CartLoaded(updatedCart));
    }
  }

  void updateQuantity(Product product, int quantity) {
    if (state is CartLoaded) {
      final List<CartItem> updatedCart = List.from((state as CartLoaded).cartItems);
      final int index = updatedCart.indexWhere((item) => item.product.id == product.id);

      if (index != -1 && quantity > 0) {
        updatedCart[index] = CartItem(product: product, quantity: quantity);
      } else if (index != -1 && quantity == 0) {
        updatedCart.removeAt(index);
      }
      emit(CartLoaded(updatedCart));
    }
  }

  void clearCart() {
    emit(CartLoaded([]));
  }
}