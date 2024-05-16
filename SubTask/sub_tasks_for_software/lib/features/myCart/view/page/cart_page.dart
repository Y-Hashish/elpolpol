import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frist_pages/core/model/product.dart';
import 'package:frist_pages/features/confirm/confirm.dart';
import 'package:frist_pages/features/myCart/controller/cartCubit.dart';
import 'package:frist_pages/features/myCart/controller/cartState.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({required this.product, required this.quantity});
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(child: Text('Your cart is empty.'));
          } else if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartItems = state.cartItems;
            double totalPrice = cartItems.fold(
                0, (sum, item) => sum + item.product.price * item.quantity);

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return ListTile(
                        leading: Image.asset(cartItem.product.image),
                        title: Text(cartItem.product.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem.product.description),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    context.read<CartCubit>().updateQuantity(
                                        cartItem.product,
                                        cartItem.quantity - 1);
                                  },
                                ),
                                Text('${cartItem.quantity}'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    context.read<CartCubit>().updateQuantity(
                                        cartItem.product,
                                        cartItem.quantity + 1);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    context
                                        .read<CartCubit>()
                                        .removeFromCart(cartItem.product);
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                                'Price: E£${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Total Price: E£${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (v) {
                      return confirmCheckout();
                    }));
                  },
                  child: Text('Confirm Checkout'),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
