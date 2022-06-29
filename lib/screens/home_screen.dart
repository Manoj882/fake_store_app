import 'package:fake_store_app/models/product_model.dart';
import 'package:fake_store_app/screens/all_categories_screen.dart';
import 'package:fake_store_app/screens/cart_screen.dart';
import 'package:fake_store_app/screens/product_details.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AllCategoryScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.view_list_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add_shopping_cart_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                ProductModel product = snapshot.data[index];
                return ListTile(
                  leading: Image.network(
                    product.image,
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    product.title,
                  ),
                  subtitle: Text(
                    "Price - \$${product.price.toString()}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(
                          id: product.id,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
