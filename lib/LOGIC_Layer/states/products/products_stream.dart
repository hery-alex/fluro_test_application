import 'dart:async';

import 'package:fluro_test_application/DATA_Layer/models/product_model/product_model.dart';
import 'package:fluro_test_application/DATA_Layer/repository/json_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsStream { 

  ProductsStream.startWithData(){
    fetchProductsFromJson();
    filterProducts();
  }

  late StreamSubscription filterSubscription;

  final BehaviorSubject<List<ProductModel>> _productsController = BehaviorSubject<List<ProductModel>>();
  final BehaviorSubject<String> _filterOption = BehaviorSubject<String>();
  
  Stream<List<ProductModel>> get productsList => _productsController.stream;


  Stream<String> get filterStream => _filterOption.stream;
  Function(String) get addFilter => _filterOption.sink.add;
   

  final DataRepository repository = JsonRepository();

  Future<void> fetchProductsFromJson() async{
     List<ProductModel> result = await repository.getDataFromJson();
     _productsController.sink.add(result);
  }

  

  void filterProducts() {
   filterSubscription = filterStream.listen((data) async{
      List<ProductModel> result = await repository.getDataFromJson();
      if(data =='Reset'){
          _productsController.sink.add(result);
      }else{
        List<ProductModel> filteredResult = result.where((i) => i.productCategory == data).toList();
        _productsController.sink.add(filteredResult);
      }
    });
  }
  
  dispose(){
    _productsController.close();
    _filterOption.close();
    filterSubscription.cancel();
  }
}