import 'package:fake_store_app/screens/category_product.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getAllCategories(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CategoryProductScreen(
                        categoryName: snapshot.data[index],
                      ),
                    ),
                  ),
                  child: Card(
                    margin: const EdgeInsets.all(15),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          snapshot.data[index].toString().toUpperCase(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
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
