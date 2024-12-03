import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/functionality/promotions/promotions_for_cart.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

mixin HelperFunctionsProductIncrementWidget<T extends StatefulWidget> on State<T> {


  void handleProductQuantityDontMatch(CartProductModel model,int productQuantity,List<CartProductModel> myCart,ProductModel productModel){
    //Updating existing model in cart by just updating the product quantity
    //----------------------------------------
    CartProductModel newModel = model.copyWith(productQuantity:productQuantity,totalPriceForProduct:productModel.productPrice! * productQuantity );
    //----------------------------------------

    //Checking if exists if not add it
    //----------------------------------------
    int checkIfExists = myCart.indexWhere((element)=> element.productChosen!.productCode == newModel.productChosen!.productCode);
      if(checkIfExists == -1){
        myCart.add(newModel);
      }
    //----------------------------------------

  }

  void handleProductQuantityMatch(CartProductModel model,int productQuantity,List<CartProductModel> myCart,ProductModel productModel){

    //Checking if exists if not add it
    //----------------------------------------
    int checkIfExists = myCart.indexWhere((element)=> element.productChosen!.productCode == model.productChosen!.productCode);
      if(checkIfExists == -1){
        myCart.add(model);
      }
    //----------------------------------------      

  }

  void handleProductMatchInCart(CartProductModel model,int productQuantity,List<CartProductModel> myCart,ProductModel productModel){
      if( model.productQuantity != productQuantity){
            handleProductQuantityDontMatch(model,productQuantity,myCart,productModel);
      }else {
          handleProductQuantityMatch(model,productQuantity,myCart,productModel);
      }
  }

  void recheckCartIfExistsAndAdd(CartProductModel model,List<CartProductModel> myCart){
    if(myCart.isNotEmpty){
           int checkIfExists = myCart.indexWhere((element)=> element.productChosen!.productCode == model.productChosen!.productCode);
      if(checkIfExists == -1){
          myCart.add(model);
        }
      }else{
        myCart.add(model);
      }
  }


  void handleProductDontMatchInCart(CartProductModel model,int productQuantity,List<CartProductModel> myCart,ProductModel productModel){

       recheckCartIfExistsAndAdd(model,myCart);
       
         
        int checkIfAdded = myCart.indexWhere((element)=> element.productChosen!.productCode == productModel.productCode);
        if(checkIfAdded == -1){
            myCart.add(CartProductModel(
            productChosen: productModel,
            productQuantity: productQuantity,
            totalPriceForProduct: productModel.productPrice! * productQuantity
          ));
        }

  }



  void handleNotEmptyCart(Promotions cartPromotions,List<CartProductModel> myCart,int productQuantity,ProductModel productModel){
     for(var model in CartProvider.of(context)!.cart.currentCart!){ 
        
        if(model.productChosen!.productCode == productModel.productCode ){
          handleProductMatchInCart(model,productQuantity,myCart,productModel);
       }else if(model.productChosen!.productCode != productModel.productCode){
          handleProductDontMatchInCart(model,productQuantity,myCart,productModel);
       }
     }
      //Remove any products with quantity 0
      //----------------------------------------  
      myCart.removeWhere((element)=> element.productQuantity == 0);
      //----------------------------------------  
      
      //Clearing all promotions first
      //----------------------------------------  
      CartProvider.of(context)!.cart.addPromotions([]);
      //----------------------------------------  

      //Adding new cart to stream
      //----------------------------------------  
      CartProvider.of(context)!.cart.addListToStream(myCart);
      //----------------------------------------  

      //Checking promotions after cart has been updated
      //----------------------------------------  
      cartPromotions.updateCartWithPromotions(myCart,context);
      //----------------------------------------  
  }

  void handleEmptyCart(Promotions cartPromotions,List<CartProductModel> myCart,int productQuantity,ProductModel productModel){
    //Creating a new CartProductModel for cart
    //----------------------------------------
        myCart.add(CartProductModel(
          productChosen: productModel,
          productQuantity: productQuantity,
          totalPriceForProduct: productModel.productPrice! * productQuantity
       ));
     //---------------------------------------- 


     //Remove any products with quantity 0
     //----------------------------------------  
      myCart.removeWhere((element)=> element.productQuantity == 0); 
     //----------------------------------------

     //Update the stream with the cart
     //----------------------------------------
      CartProvider.of(context)!.cart.addListToStream(myCart);
     //----------------------------------------

     //Check if any promotion applies
     //----------------------------------------
     cartPromotions.updateCartWithPromotions(myCart,context);
     //----------------------------------------
  }
  

 void addProductToCart(ProductModel productModel,int productQuantity){
      Promotions cartPromotions = PromotionsForCart();
      List<CartProductModel> myCart =[];
    if(CartProvider.of(context)!.cart.currentCart != null && CartProvider.of(context)!.cart.currentCart!.isNotEmpty){
      handleNotEmptyCart(cartPromotions, myCart, productQuantity, productModel);
    }else{
      handleEmptyCart(cartPromotions,myCart,productQuantity,productModel);
     }
  }
}