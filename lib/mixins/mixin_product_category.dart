import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

mixin MixinProductCategory {
    
    Widget getCategoryIcon(ProductModel productModel){
    switch(productModel.productCategory){
      case 'Croissant':
        return Image(image: FluroImageAssets.croissantIcon,width: 70,height:70,);
      case 'Muffin':
        return Image(image: FluroImageAssets.muffinIcon,width: 50,height:50,);
      case 'Brownie':
        return Image(image: FluroImageAssets.brownieIcon,width: 50,height:50,); 
      case 'Cake' :
        return Image(image: FluroImageAssets.cakeIcon,width: 50,height:50,);
      case 'Cupcakes':
          return Image(image: FluroImageAssets.cupcakeIcon,width: 50,height:50,);
      default:
       return const SizedBox();               
    }
  }
}