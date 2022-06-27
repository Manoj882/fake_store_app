import 'package:fake_store_app/screens/product_details.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({required this.categoryName, Key? key})
      : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName.toUpperCase(),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getProductByCategory(categoryName),
        builder: (context, AsyncSnapshot snapshot) {
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
                    'Price - \$${snapshot.data[index]['price']}',
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetails(
                        id: snapshot.data[index]['id'],
                      ),
                    ),
                  ),
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
