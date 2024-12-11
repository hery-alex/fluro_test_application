import 'package:fluro_test_application/LOGIC_Layer/mixins/mixin_helper_for_promotions.dart';
import 'package:fluro_test_application/DATA_Layer/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/DATA_Layer/models/cart_models/cart_promotion_model.dart';
import 'package:fluro_test_application/DATA_Layer/models/product_model/product_model.dart';
import 'package:fluro_test_application/LOGIC_Layer/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

enum PromotionsType{
  none,
  multipriced,
  getFreeForAmmount,
  mealDeal
}

abstract class Promotions{
  PromotionsType promotionsAvailable(ProductModel productModel);
  void updateCartWithPromotions(List<CartProductModel> cartList,BuildContext context);
  CartPromotionModel? checkForPromotions(PromotionsType promType,CartProductModel cartProductModel);
}


class PromotionsForCart extends Promotions with MixinHelperForPromotions{


  @override
 CartPromotionModel? checkForPromotions(PromotionsType promType,CartProductModel cartProductModel,{List<CartProductModel>? cartProductsList}){
    switch(promType){
      case PromotionsType.multipriced:
      return  handleMultiPricedPromotions(promType,cartProductModel,cartProductsList: cartProductsList);
      case PromotionsType.getFreeForAmmount:
      return handlegetFreeForAmmountPromotions(promType,cartProductModel,cartProductsList: cartProductsList);
      case PromotionsType.mealDeal:
      return handleGetmealDealPromotions(promType,cartProductModel,cartProductsList: cartProductsList);
      default:
      return null;   
    }
  }

  @override
   void updateCartWithPromotions(List<CartProductModel> cartList,BuildContext context){
      List<CartPromotionModel> promotions =[];
      handleMultiPricedAndFreeForAmmount(cartList,context,promotions);
      handleMealDealPromotions(cartList,context,promotions);
   }


   @override
     PromotionsType promotionsAvailable(ProductModel productModel){
     switch(productModel.productSKU){
      case 'A':
         return PromotionsType.none;
      case 'B':
         return PromotionsType.multipriced;
      case 'C':
         return PromotionsType.getFreeForAmmount;
      case 'D' :
      case 'E' :
         return PromotionsType.mealDeal;       
     
      default : 
        return PromotionsType.none;    
    }
  }


  handleMultiPricedAndFreeForAmmount(List<CartProductModel> cartList,BuildContext context,List<CartPromotionModel> promotions){
        for(var sky in ['B','C']){
          List<CartProductModel> filteredList = cartList.where((element)=> element.productChosen!.productSKU == sky).toList();
       if(filteredList.isNotEmpty){   
            CartProductModel modelWithAll =   CartProductModel(
                  productChosen: filteredList[0].productChosen,
                  productQuantity:filteredList.fold(0, (sum, item) => sum! + item.productQuantity!),
                  totalPriceForProduct: filteredList[0].productChosen!.productPrice,
                  
              );
            CartPromotionModel? promotion =  checkForPromotions(promotionsAvailable(modelWithAll.productChosen!),modelWithAll);
           if(promotion !=null){
                promotions.add(promotion);

              if(CartProvider.of(context)!.cart.currentPromotions != null){
                int existsIndex  = CartProvider.of(context)!.cart.currentPromotions!.indexWhere((element)=> element.promotionCode ==promotion.promotionCode);
                  if(existsIndex == -1){
                    CartProvider.of(context)!.cart.addPromotions(promotions);
                  }else{
                    CartProvider.of(context)!.cart.currentPromotions![existsIndex]=promotion;
                  }
              }
                CartProvider.of(context)!.cart.addPromotions(promotions);
           }
       }
      }
  }


  handleMealDealPromotions(List<CartProductModel> cartList,BuildContext context,List<CartPromotionModel> promotions){
     List<CartProductModel> filteredListMealDeal = cartList.where((element)=> element.productChosen!.productSKU == 'D' 
    || element.productChosen!.productSKU == 'E').toList();

    if(filteredListMealDeal.isNotEmpty){   
            CartProductModel modelWithAll =   CartProductModel(
                  productQuantity:filteredListMealDeal.fold(0, (sum, item) => sum! + item.productQuantity!),
                  totalPriceForProduct: filteredListMealDeal[0].productChosen!.productPrice,
                  
              );
            CartPromotionModel? promotion =  checkForPromotions(PromotionsType.mealDeal  ,modelWithAll,cartProductsList: filteredListMealDeal);
           if(promotion !=null){
                promotions.add(promotion);

              if(CartProvider.of(context)!.cart.currentPromotions != null){
                int existsIndex  = CartProvider.of(context)!.cart.currentPromotions!.indexWhere((element)=> element.promotionCode ==promotion.promotionCode);
                  if(existsIndex == -1){
                    CartProvider.of(context)!.cart.addPromotions(promotions);
                  }else{
                    CartProvider.of(context)!.cart.currentPromotions![existsIndex]=promotion;
                  }
              }
               CartProvider.of(context)!.cart.addPromotions(promotions);
           }
       }
  }

 

  


}