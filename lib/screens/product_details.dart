import 'package:fake_store_app/constants/constant.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.id, Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fake Store App'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getSingleProduct(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: basePadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        snapshot.data['title'],
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(
                            snapshot.data['category'],
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        Text(
                          '\$${snapshot.data['price'].toString()}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data['description'],
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart_outlined),
        onPressed: (){},
        backgroundColor: Colors.pinkAccent,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
