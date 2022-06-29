import 'package:fake_store_app/models/fruit_model.dart';
import 'package:fake_store_app/services/api_services.dart';
import 'package:flutter/material.dart';

class AllFruitScreen extends StatelessWidget {
  const AllFruitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getAllFruits(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Fruit fruits = snapshot.data[index];
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(fruits.name),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        Text('Carbohydrates: ${fruits.nutritions.carbohydrates}'),
                        Text('Protein: ${fruits.nutritions.protein}'),
                        Text('Fat: ${fruits.nutritions.fat}'),
                        
                
                
                      ],
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
