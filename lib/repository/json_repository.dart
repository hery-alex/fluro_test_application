import 'dart:convert';

import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/services.dart';

abstract class DataRepository{
  Future<List<ProductModel>> getDataFromJson();
}


class JsonRepository extends DataRepository{
 
 @override
 Future<List<ProductModel>> getDataFromJson() async{

  try{
      final String productsData = await rootBundle.loadString('assets/jsonData/jsonDataProducts.json');
      final data = await json.decode(productsData);
      List<ProductModel> productsList = [];
        for(var singleProduct in data['products']){
        productsList.add(ProductModel.fromJson(singleProduct));
      }

      return productsList;
 }catch(e){
   throw Exception('Cannot get products $e'); 
  }

}

}

