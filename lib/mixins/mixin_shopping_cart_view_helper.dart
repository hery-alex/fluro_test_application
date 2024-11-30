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

 double calculatePriceAfterPromotions(List<CartPromotionModel> promotions,List<CartProductModel> products) {
   double result = 0;
   for(var singlePromotion in promotions){
        result = singlePromotion.totalPriceForProduct! + result;
   }
   for(var singleProduct in products){
      if(singleProduct.productChosen!.productSKU == 'A'){
        result = singleProduct.totalPriceForProduct! + result;
      }
   }
  return result / 100;
 }

 double calculateNumberOfProductsWithPromotions(List<CartPromotionModel> promotions,List<CartProductModel> products) {
   double result = 0;
   for(var singlePromotion in promotions){
        result = singlePromotion.productQuantity! + result;
   }
   for(var singleProduct in products){
      if(singleProduct.productChosen!.productSKU == 'A'){
        result = singleProduct.productQuantity! + result;
      }
   }
  return result ;
 }

 double calculateNumberOfProducts(List<CartProductModel> products){
  double result = 0;
     for(var singleProduct in products){
        result = singleProduct.productQuantity! + result;
   }
  return result ;
 }

}