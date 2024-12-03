import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/functionality/promotions/promotions_for_cart.dart';
import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/models/cart_models/cart_promotion_model.dart';

mixin MixinHelperForPromotions {


  CartPromotionModel? handleMultiPricedPromotions(PromotionsType promType,CartProductModel cartProductModel,{List<CartProductModel>? cartProductsList}){
     int productsWithPromo = (cartProductModel.productQuantity! / 2).floor();
      if(productsWithPromo !=0){
        int productsLeft = cartProductModel.productQuantity!.remainder(2);
        return CartPromotionModel(
          productQuantity: cartProductModel.productQuantity,
          totalPriceForProduct: (productsWithPromo) * 125 + productsLeft * cartProductModel.productChosen!.productPrice!,
          promotionDescription: '2 for £ 1.25',
          imageIcon: FluroImageAssets.muffinIcon,
          promotionCode:1,
          promotionAppliedTimes: productsWithPromo,
        );
      }else{
        return null;
      }
  }

  CartPromotionModel? handlegetFreeForAmmountPromotions(PromotionsType promType,CartProductModel cartProductModel,{List<CartProductModel>? cartProductsList}){
    int productsWithPromo = (cartProductModel.productQuantity! / 3).floor();
      if(productsWithPromo !=0){
      return CartPromotionModel(
        productQuantity: productsWithPromo > 0 ? cartProductModel.productQuantity! + productsWithPromo : cartProductModel.productQuantity,
        totalPriceForProduct: (cartProductModel.productQuantity!) *  cartProductModel.productChosen!.productPrice!,
        promotionDescription: 'Buy 3, get one free',
        imageIcon: FluroImageAssets.brownieIcon,
        promotionCode: 2,
        promotionAppliedTimes: productsWithPromo
      );
      }else{
        return null;
      }
  }

   CartPromotionModel? handleGetmealDealPromotions(PromotionsType promType,CartProductModel cartProductModel,{List<CartProductModel>? cartProductsList}){
       List<CartProductModel> productsWithD = cartProductsList!.where((element)=> element.productChosen!.productSKU == 'D').toList();
      List<CartProductModel> productsWithE = cartProductsList.where((element)=> element.productChosen!.productSKU == 'E').toList();
      int quanityD = productsWithD.fold(0, (sum, item) => sum + item.productQuantity!);
      int quanityE = productsWithE.fold(0, (sum, item) => sum + item.productQuantity!);
         if(quanityE !=0 && quanityD !=0){
          return  quanityD == quanityE 
            ? returnPromotionModel(quanityD + quanityE,(quanityD) * 300,quanityD)  
            : quanityD > quanityE 
            ? returnPromotionModel(quanityE + quanityD, (quanityE) * 300 + (quanityD - quanityE) * 150, quanityE) 
            : returnPromotionModel(quanityD + quanityE, (quanityD) * 300 + (quanityE - quanityD) * 200, quanityD);  
          
         }
      return null;
   }

   CartPromotionModel returnPromotionModel(int productQuantity,double totalPriceForProduct,int promotionAppliedTimes){
         return CartPromotionModel(
            productQuantity: productQuantity,
            totalPriceForProduct: totalPriceForProduct,
            promotionDescription: 'Meal Deal for £ 3.00',
            imageIcon: FluroImageAssets.croissantIcon,
            promotionCode:3,
            promotionAppliedTimes: promotionAppliedTimes
          );
   }


}