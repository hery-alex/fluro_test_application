import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/promotions/promotions_for_cart.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

mixin HelperFunctionsProductIncrementWidget<T extends StatefulWidget> on State<T> {
  

  void addProductToCart(ProductModel productModel,int productQuantity){
      Promotions cartPromotions = PromotionsForCart();
     List<CartProductModel> myCart =[];
    if(CartProvider.of(context)!.cart.currentCart != null && CartProvider.of(context)!.cart.currentCart!.isNotEmpty){
      for(var model in CartProvider.of(context)!.cart.currentCart!){ 
        
        if(model.productChosen!.productCode == productModel.productCode ){
         if( model.productQuantity != productQuantity){
          CartProductModel newModel = model.copyWith(productQuantity:productQuantity,totalPriceForProduct:productModel.productPrice! * productQuantity );
        
           int fourthIndex = myCart.indexWhere((element)=> element.productChosen!.productCode == newModel.productChosen!.productCode);
           if(fourthIndex == -1){
              myCart.add(newModel);
           }
          }else {
             int thirdIndex = myCart.indexWhere((element)=> element.productChosen!.productCode == model.productChosen!.productCode);
             if(thirdIndex == -1){
               myCart.add(model);
             }
          }
       }else if(model.productChosen!.productCode != productModel.productCode){
       
         if(myCart.isNotEmpty){
           int index = myCart.indexWhere((element)=> element.productChosen!.productCode == model.productChosen!.productCode);
         if(index == -1){
              myCart.add(model);
            }
         }else{
           myCart.add(model);
         }
         
        int secondindex = myCart.indexWhere((element)=> element.productChosen!.productCode == productModel.productCode);
        if(secondindex == -1){
            myCart.add(CartProductModel(
            productChosen: productModel,
            productQuantity: productQuantity,
            totalPriceForProduct: productModel.productPrice! * productQuantity
          ));
        }
       }
     }
      myCart.removeWhere((element)=> element.productQuantity == 0);
      CartProvider.of(context)!.cart.addPromotions([]);
      CartProvider.of(context)!.cart.addListToStream(myCart);
      cartPromotions.updateCartWithPromotions(myCart,context);
    }else{
   
        myCart.add(CartProductModel(
          productChosen: productModel,
          productQuantity: productQuantity,
          totalPriceForProduct: productModel.productPrice! * productQuantity
       ));
      myCart.removeWhere((element)=> element.productQuantity == 0); 
      CartProvider.of(context)!.cart.addListToStream(myCart);
      cartPromotions.updateCartWithPromotions(myCart,context);
    }
  }
}