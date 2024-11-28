import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

mixin HelperFunctionsProductIncrementWidget<T extends StatefulWidget> on State<T> {
  

  void addProductToCart(ProductModel productModel,int productQuantity){
     List<CartProductModel> myCart =[];
    if(CartProvider.of(context)!.cart.currentCart != null && CartProvider.of(context)!.cart.currentCart!.isNotEmpty){
      for(var model in CartProvider.of(context)!.cart.currentCart!){ 
        if(model.productChosen!.productCode == productModel.productCode ){
         if( model.productQuantity != productQuantity){
           model.copyWith(productQuantity:productQuantity,totalPriceForProduct:productModel.productPrice! * productQuantity );
           myCart.add(model);
          }else{
           myCart.add(model);
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
     
      CartProvider.of(context)!.cart.addListToStream(myCart);
    }else{
   
        myCart.add(CartProductModel(
          productChosen: productModel,
          productQuantity: productQuantity,
          totalPriceForProduct: productModel.productPrice! * productQuantity
       ));
      CartProvider.of(context)!.cart.addListToStream(myCart);
    }
  }
}