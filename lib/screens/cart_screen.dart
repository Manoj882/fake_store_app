import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Carts'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: ApiService()
                      .getSingleProduct(products[index]['productId']),
                  builder: (context, AsyncSnapshot asyncSnapshot) {
                    if (asyncSnapshot.hasData) {
                      return ListTile(
                        title: Text(asyncSnapshot.data['title']),
                        leading: Image.network(
                          asyncSnapshot.data['image'],
                          height: 50,
                          width: 50,
                        ),
                        subtitle: Text(
                            'Quantity - ${snapshot.data['quantity'].toString()}'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: Colors.red,
                          ),
                        ),
                      );
                    } else {
                      return const LinearProgressIndicator();
                    }
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
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.pinkAccent,
        child: Center(
          child: Text(
            'Order Now',
            style: Theme.of(context).textTheme.headline6!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
