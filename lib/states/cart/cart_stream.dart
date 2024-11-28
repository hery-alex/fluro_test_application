import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:rxdart/rxdart.dart';

class CartStream {



final BehaviorSubject<List<CartProductModel>> _cartProductsList = BehaviorSubject<List<CartProductModel>>();

Stream<List<CartProductModel>> get cartProductsList => _cartProductsList.stream;

Function(List<CartProductModel>) get addListToStream => _cartProductsList.sink.add;

 List<CartProductModel>? get currentCart => _cartProductsList.hasValue ? _cartProductsList.value : null;

}