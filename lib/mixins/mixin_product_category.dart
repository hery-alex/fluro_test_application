import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

mixin MixinProductCategory {
    
    Widget getCategoryIcon(ProductModel productModel,bool alternate){
    switch(productModel.productCategory){
      case 'Croissant':
        return Image(image: FluroImageAssets.croissantIcon,width: alternate ? 30 : 70,height:alternate ? 30 : 70,);
      case 'Muffin':
        return Image(image: FluroImageAssets.muffinIcon,width:  alternate ? 30 :50,height: alternate ? 30 :50,);
      case 'Brownie':
        return Image(image: FluroImageAssets.brownieIcon,width: alternate ? 30 : 50,height: alternate ? 30 :50,); 
      case 'Cake' :
        return Image(image: FluroImageAssets.cakeIcon,width:  alternate ? 30 :50,height: alternate ? 30 :50,);
      case 'Cupcakes':
          return Image(image: FluroImageAssets.cupcakeIcon,width: alternate ? 30 : 50,height: alternate ? 30 :50,);
      default:
       return const SizedBox();               
    }
  }
}