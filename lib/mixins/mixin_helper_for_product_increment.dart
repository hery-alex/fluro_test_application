import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

mixin HelperFunctionsProductIncrementWidget<T extends StatefulWidget> on State<T> {
  

  void addProductToCart(ProductModel productModel,int productQuantity){
     List<CartProductModel> myCart =[];
    if(CartProvider.of(context)!.cart.currentCart.isNotEmpty){
      for(var model in CartProvider.of(context)!.cart.currentCart){ 
       if(model.productQuantity != productQuantity){
          model.copyWith(productQuantity:productQuantity,totalPriceForProduct:productModel.productPrice! * productQuantity );
       }
      }

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