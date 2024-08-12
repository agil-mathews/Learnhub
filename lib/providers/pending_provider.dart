import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:learnhub/models/product.dart';

class PendingProvider extends ChangeNotifier {
 
    List<Product> _products = [];

     List<Product> get product => _products;


    void setPending(String pendings){
    try {
     if (kDebugMode) {
       print('Received pendings JSON: $pendings');
     }
    final productJson = jsonDecode(pendings);
    final List<dynamic> pendingListJson = productJson['allpendings']; // Access the nested "pending" object
   
     if (kDebugMode) {
       print('all pendings data: $pendingListJson');
     }

  // Map each item in the list to a Product object
    List<Product> products = pendingListJson.map((json) => Product.fromJson(json)).toList();
    if (kDebugMode) {
      print('product list: $products');
    }

_products = products; // Assuming you have a list _products to hold the products;
  
        notifyListeners();
     
    } catch (e) {
      if (kDebugMode) {
        print('Error setting user: $e');
      }
    }
  }


     void setProductFromModel(Product product){
    _products = _products;
    notifyListeners();
  }
  
}