
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
}
