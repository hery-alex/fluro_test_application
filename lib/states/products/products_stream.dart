import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/repository/json_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductsStream { 

  ProductsStream.startWithData(){
    fetchProductsFromJson();
  }

  final BehaviorSubject<List<ProductModel>> _productsController = BehaviorSubject<List<ProductModel>>();
  
  Stream<List<ProductModel>> get productsList => _productsController.stream;
   

  final DataRepository repository = JsonRepository();

  Future<void> fetchProductsFromJson() async{
     List<ProductModel> result = await repository.getDataFromJson();
     print('results $result');
     _productsController.sink.add(result);
  }
  
  dispose(){
    _productsController.close();
  }
}