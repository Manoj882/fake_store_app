
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{
  //Future method for fetching all products
  Future getAllProducts()async{
    final allProductsURL = Uri.parse('https://fakestoreapi.com/products');
    final response = await http.get(allProductsURL);

    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;

  }

  //Future method for fetching single products
  Future getSingleProduct(int id) async{
    final singleProductURL = Uri.parse('https://fakestoreapi.com/products/$id');
    final response = await http.get(singleProductURL);
    
    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
  // For fetching product categories
   Future getAllCategories() async{
    final allCategoryURL = Uri.parse('https://fakestoreapi.com/products/categories');
    final response = await http.get(allCategoryURL);
    
    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  // For fetching product according to categories
   Future getProductByCategory(String categoryName) async{
    final fetchProductCategoryURL = Uri.parse('https://fakestoreapi.com/products/category/$categoryName');
    final response = await http.get(fetchProductCategoryURL);
    
    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }


  //for fetching cart data
  Future getCart(String userId) async{
    final fetchCartProducts = Uri.parse('https://fakestoreapi.com/carts/$userId');
    final response = await http.get(fetchCartProducts);
    
    print(response.statusCode);
    print(response.body);

    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }


}
