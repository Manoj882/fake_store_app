import 'dart:convert';
import 'package:fake_store_app/models/fruit_model.dart';
import 'package:fake_store_app/models/product_model.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //Future method for fetching all products
  Future<List<ProductModel>> getAllProducts() async {
    final allProductsURL = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductsURL);


    // print(response.statusCode);
    // print(response.body);
    // final decodedResponse = jsonDecode(response.body);
    // return decodedResponse;


    
    List decodedResponse = json.decode(response.body);
    List<ProductModel> allProducts = [];
  
    // decodedResponse.forEach((product) {
    //   allProducts.add(
    //     ProductModel.fromJson(product),
    //   );
    // });

    
    for (var product in decodedResponse){
      allProducts.add(ProductModel.fromJson(product));
    }
    return allProducts;
  }

  //Future method for fetching single products
  Future getSingleProduct(int id) async {
    final singleProductURL = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductURL);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    // return decodedResponse;
    return ProductModel.fromJson(decodedResponse);
  }

  // For fetching product categories
  Future getAllCategories() async {
    final allCategoryURL =
        Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(allCategoryURL);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  // For fetching product according to categories
  Future getProductByCategory(String categoryName) async {
    final fetchProductCategoryURL =
        Uri.parse('https://fakestoreapi.com/products/category/$categoryName');
    final response = await http.get(fetchProductCategoryURL);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  //for fetching cart data
  Future getCart(String userId) async {
    final fetchCartProducts =
        Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.get(fetchCartProducts);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  //POST request
  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse('https://fakestoreapi.com/auth/login');
    final response = await http.post(loginUrl, body: {
      'username': username,
      'password': password,
    });

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  //Update cart
  Future updateCart(int userId, int productId) async {
    final updateCartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.put(updateCartUrl, body: {
      'userId': '$userId',
      'date': DateTime.now().toString(),
      'products': [
        {
          'productId': '$productId',
          'quantity': '1',
        }
      ].toString(),
    });

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  //Delete cart
  Future deleteCart(String userId) async {
    final deleteCartUrl = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.delete(deleteCartUrl);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  //For fetching all fruits

  Future<List<Fruit>> getAllFruits() async{
    final allFruitsUrl = Uri.parse('https://www.fruityvice.com/api/fruit/all');
    final response = await http.get(allFruitsUrl);

    List decodedResponse = jsonDecode(response.body);

    // List<Fruit> allFruits = [];
    // for(var fruits in decodedResponse){
    //   allFruits.add(Fruit.fromJson(fruits));
    // }
    // return allFruits;

    List<Fruit> allFruits = decodedResponse.map((fruit) => Fruit.fromJson(fruit)).toList();
    return allFruits;


  }


}
