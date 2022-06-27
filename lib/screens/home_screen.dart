import 'package:fake_store_app/screens/all_categories_screen.dart';
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
          )
        ],
      ),
      body: FutureBuilder(
        future: ApiService().getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    snapshot.data[index]['image'],
                    height: 50,
                    width: 50,
                  ),
                  title: Text(
                    snapshot.data[index]['title'],
                  ),
                  subtitle: Text(
                    "Price - \$${snapshot.data[index]['price'].toString()}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetails(
                          id: snapshot.data[index]['id'],
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
