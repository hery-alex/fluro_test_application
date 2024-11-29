import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/cart_models/cart_promotion_model.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
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
  CartPromotionModel? calculationsForPromotions(PromotionsType promType,CartProductModel cartProductModel);
}


class PromotionsForCart extends Promotions {


  @override
 CartPromotionModel? calculationsForPromotions(PromotionsType promType,CartProductModel cartProductModel,{List<CartProductModel>? cartProductsList}){
    switch(promType){
      case PromotionsType.multipriced:
      int productsWithPromo = (cartProductModel.productQuantity! / 2).floor();
      if(productsWithPromo !=0){
        int productsLeft = cartProductModel.productQuantity!.remainder(2);
        return CartPromotionModel(
          productQuantity: cartProductModel.productQuantity,
          totalPriceForProduct: (productsWithPromo) * 125 + productsLeft * cartProductModel.productChosen!.productPrice!,
          promotionDescription: '2 for £ 1.25',
          imageIcon: FluroImageAssets.muffinIcon,
          promotionCode:1
        );
      }else{
        return null;
      }
      case PromotionsType.getFreeForAmmount:
      int productsWithPromo = (cartProductModel.productQuantity! / 3).floor();
      if(productsWithPromo !=0){
      return CartPromotionModel(
        productQuantity: productsWithPromo > 0 ? cartProductModel.productQuantity! + productsWithPromo : cartProductModel.productQuantity,
        totalPriceForProduct: (cartProductModel.productQuantity!) *  cartProductModel.productChosen!.productPrice!,
        promotionDescription: 'Buy 3, get one free',
        imageIcon: FluroImageAssets.brownieIcon,
        promotionCode: 2
      );
      }else{
        return null;
      }
      case PromotionsType.mealDeal:
      List<CartProductModel> productsWithD = cartProductsList!.where((element)=> element.productChosen!.productSKU == 'D').toList();
      List<CartProductModel> productsWithE = cartProductsList.where((element)=> element.productChosen!.productSKU == 'E').toList();
      int quanityD = productsWithD.fold(0, (sum, item) => sum + item.productQuantity!);
      int quanityE = productsWithE.fold(0, (sum, item) => sum + item.productQuantity!);
      if(quanityD == quanityE && quanityE !=0 && quanityD !=0){
        return CartPromotionModel(
          productQuantity: quanityD + quanityE,
          totalPriceForProduct: (quanityD) * 300,
          promotionDescription: 'Meal Deal for £ 3.00',
          imageIcon: FluroImageAssets.croissantIcon,
          promotionCode:3
        );
      }else if(quanityD > quanityE && quanityE !=0 && quanityD !=0) {
         int productsLeft = quanityD - quanityE;
            
        return CartPromotionModel(
          productQuantity: quanityE + quanityD,
          totalPriceForProduct: (quanityE) * 300 + productsLeft * 150,
          promotionDescription: 'Meal Deal for £ 3.00',
          imageIcon: FluroImageAssets.croissantIcon,
          promotionCode:3
        );
      }else if(quanityE > quanityD && quanityE !=0 && quanityD !=0 ) {
           int productsLeft = quanityE - quanityD;
         return CartPromotionModel(
            productQuantity: quanityD + quanityE,
            totalPriceForProduct: (quanityD) * 300 + productsLeft * 200,
            promotionDescription: 'Meal Deal for £ 3.00',
            imageIcon: FluroImageAssets.croissantIcon,
            promotionCode:3
          );
      }
      return null;
      default:
      return null;   
    }
  }

  @override
   void updateCartWithPromotions(List<CartProductModel> cartList,BuildContext context){
       List<CartPromotionModel> promotions =[];
       for(var sky in ['B','C']){
          List<CartProductModel> filteredList = cartList.where((element)=> element.productChosen!.productSKU == sky).toList();
       if(filteredList.isNotEmpty){   
            CartProductModel modelWithAll =   CartProductModel(
                  productChosen: filteredList[0].productChosen,
                  productQuantity:filteredList.fold(0, (sum, item) => sum! + item.productQuantity!),
                  totalPriceForProduct: filteredList[0].productChosen!.productPrice,
                  
              );
            CartPromotionModel? promotion =  calculationsForPromotions(promotionsAvailable(modelWithAll.productChosen!),modelWithAll);
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
    
    List<CartProductModel> filteredListMealDeal = cartList.where((element)=> element.productChosen!.productSKU == 'D' 
    || element.productChosen!.productSKU == 'E').toList();

    if(filteredListMealDeal.isNotEmpty){   
            CartProductModel modelWithAll =   CartProductModel(
                  productQuantity:filteredListMealDeal.fold(0, (sum, item) => sum! + item.productQuantity!),
                  totalPriceForProduct: filteredListMealDeal[0].productChosen!.productPrice,
                  
              );
            CartPromotionModel? promotion =  calculationsForPromotions(PromotionsType.mealDeal  ,modelWithAll,cartProductsList: filteredListMealDeal);
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

 

  


}