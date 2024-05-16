import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:frist_pages/core/model/dataBase.dart';
import 'package:frist_pages/core/model/product.dart';
import 'package:frist_pages/features/home/home_page.dart';
import 'package:frist_pages/features/menuItem/controller/productCubit.dart';
import 'package:frist_pages/features/menuItem/controller/productState.dart';
import 'package:frist_pages/features/myCart/controller/cartCubit.dart';
import 'package:frist_pages/features/myCart/view/page/cart_page.dart';
import 'package:frist_pages/features/verification/view/page/verification_code_page.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import your database package

Product p2 = Product(1, 'calamari', '6 Peices fried calamri', 'Appetizers',
    69.99, 1, 'assets/images/calamari.jpg');
Product p1 = Product(2, 'Steak Florentine', 'medium reare steak florinte',
    'Main Courses', 359.99, 1, 'assets/images/SteakFlorentine.jpg');
Product p3 = Product(3, 'Tiramisu', 'An italian dessert', 'desserts', 99.99, 1,
    'assets/images/Tiramisu.jpg');

DataBaseHandler sqldb = DataBaseHandler();

// void main() async {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => CartCubit()), // Provide the CartCubit
      ],
      child: MaterialApp(
        home: MenuPage(),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ProductCubit productCubit = ProductCubit();

  @override
  void initState() {
    super.initState();
    productCubit.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: productCubit,
      builder: (context, state) {
        if (state is ProductInitial) {
          return Center(child: Text(state.message));
        } else if (state is ProductLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          final products = state.products;
          final List<String> categories =
              products.map((product) => product.category).toSet().toList();

          return DefaultTabController(
            length: categories.length,
            child: Scaffold(
              //   appBar: AppBar(
              //   toolbarHeight: 40,
              //   backgroundColor: const Color.fromARGB(255, 28, 41, 126),
              //   title: const Text(" "),
              // ),
              appBar: AppBar(
                title: const Text('Food Circles'),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
                bottom: categories.isNotEmpty
                    ? TabBar(
                        tabs: categories
                            .map((category) => Tab(text: category))
                            .toList(),
                      )
                    : null,
                // ),

                //  toolbarHeight: 80,
              ),
              body: categories.isNotEmpty
                  ? TabBarView(
                      children: categories.map((category) {
                        final categoryProducts = products
                            .where((product) => product.category == category)
                            .toList();
                        return buildMenuItems(categoryProducts);
                      }).toList(),
                    )
                  : Center(
                      child: Text('No products available.'),
                    ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Icon(Icons.shopping_cart),
                tooltip: 'View Cart',
              ),
            ),
          );
        } else {
          return Center(child: Text('Unknown state'));
        }
      },
    );
  }

  Widget buildMenuItems(List<Product> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildMenuItem(items[index]);
      },
    );
  }

  Widget buildMenuItem(Product item) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              item.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(item.description),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'E£${item.price.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Added to cart successfully'),
                              backgroundColor: Colors.green),
                        );
                        context
                            .read<CartCubit>()
                            .addToCart(item); // Add to cart using CartCubit
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Two Buttons',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TwoButtonsScreen(),
//     );
//   }
// }

// class TwoButtonsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Two Buttons'),
//       ),
//       body: Center(
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           ElevatedButton(
//             onPressed: () async {
//               await sqldb.addProduct(p1);
//               await sqldb.addProduct(p2);
//               await sqldb.addProduct(p3);

//               // Action for first button
//               log('First button pressed');
//             },
//             child: Text('Button 1'),
//           ),
//           SizedBox(height: 20), // Adding space between buttons
//         ]),
//       ),
//     );
//   }
// }
