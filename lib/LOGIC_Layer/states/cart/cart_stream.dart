import 'package:fluro_test_application/DATA_Layer/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/DATA_Layer/models/cart_models/cart_promotion_model.dart';
import 'package:rxdart/rxdart.dart';

class CartStream {



final BehaviorSubject<List<CartProductModel>> _cartProductsList = BehaviorSubject<List<CartProductModel>>();
final BehaviorSubject<List<CartPromotionModel>> _promotionsList =  BehaviorSubject<List<CartPromotionModel>>();

Stream<List<CartProductModel>> get cartProductsList => _cartProductsList.stream;
Stream<List<CartPromotionModel>> get promotionsList => _promotionsList.stream;

Function(List<CartProductModel>) get addListToStream => _cartProductsList.sink.add;
Function(List<CartPromotionModel>) get addPromotions => _promotionsList.sink.add;

 List<CartProductModel>? get currentCart => _cartProductsList.hasValue ? _cartProductsList.value : null;
 List<CartPromotionModel>? get currentPromotions => _promotionsList.hasValue ? _promotionsList.value : null;

 dispose(){
    _cartProductsList.close();
    _promotionsList.close();
  }

}