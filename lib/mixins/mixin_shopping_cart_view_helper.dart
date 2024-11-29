import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/cart_models/cart_promotion_model.dart';

mixin MixinShoppingCartViewHelper  {

double calculateTotalPrice(List<CartProductModel> products) {
   double result = 0;
   for(var singleProduct in products){
        result = singleProduct.totalPriceForProduct! + result;
   }
  return result / 100;
 }

 double calculatePriceAfterPromotions(List<CartPromotionModel> promotions) {
   double result = 0;
   for(var singleProduct in promotions){
        result = singleProduct.totalPriceForProduct! + result;
   }
  return result / 100;
 }

}