import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/mixins/mixin_product_category.dart';
import 'package:fluro_test_application/mixins/mixin_shopping_cart_view_helper.dart';
import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget with MixinShoppingCartViewHelper,MixinProductCategory{
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
         padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
         child: InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.blueGrey[50],
                ),
                const SizedBox(width: 30,),
                Text.rich(
                  TextSpan(
                    text: 'Back to products screen',
                    style:  TextStyle(
                      color: Colors.blueGrey[50],
                      fontSize: 15,
                    )
                  )
                ),
              ],
            ),
         ),
        ),
        Container(
         padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
         width: SizeConfig.screenWidth,
         height: 80,
         child: Row(
          children: [
            Image(image: FluroImageAssets.cartIcon,width: 40,height: 40,),
            const SizedBox(width: 20,),
             Text.rich(
              TextSpan(
                text: 'Cart',
                style:  TextStyle(
                  color: Colors.blueGrey[50],
                  fontSize: 30,
                )
              )
            ),
          ],
         ),
        ),
        SizedBox(
          child: StreamBuilder(
            stream: CartProvider.of(context)!.cart.cartProductsList, 
            builder:(context,AsyncSnapshot<List<CartProductModel>> snapshot) {
                if(!snapshot.hasData){
                  return  SizedBox(
                    height: SizeConfig.screenHeight! / 2.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: 'Cart is empty',
                            style:  TextStyle(
                              color: Colors.blueGrey[50],
                              fontSize: 30,
                            )
                          )
                        )
                      ],
                    ),
                  );
                }



                return Column(
                  children: [
                    Container(
                      height: SizeConfig.screenHeight! / 2.5,
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder:(context, index) {
                          
                           return Container(
                             height: 40,
                             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                             decoration: BoxDecoration(
                              color: Colors.blueGrey[50],
                              border: Border(
                                top: index != 0 
                                ? const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )  : BorderSide.none,
                                bottom:  index != snapshot.data!.length
                                ? const BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )  : BorderSide.none,
                              )
                             ),
                             child: Row(
                               children: [
                                 Expanded(
                                  flex: 10,
                                   child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                      getCategoryIcon(snapshot.data![index].productChosen!,true),
                                       Text.rich(
                                        TextSpan(
                                          text: '${snapshot.data![index].productChosen!.productTitle}',
                                          style:  TextStyle(
                                            color: Colors.blueGrey[900],
                                            fontSize: 14,
                                          )
                                        )
                                       ),
                                     ],
                                   ),
                                 ),
                                 Expanded(
                                  flex: 2,
                                   child: Text.rich(
                                    TextSpan(
                                      text: 'X ${snapshot.data![index].productQuantity}',
                                      style:  TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900
                                      )
                                    )
                                   ),
                                 ),
                                 Expanded(
                                  flex: 2,
                                   child: Text.rich(
                                    TextSpan(
                                      text: '£ ${snapshot.data![index].totalPriceForProduct! / 100}',
                                      style:  TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontSize: 14,
                                      )
                                    )
                                   ),
                                 ),
                               ],
                             ),
                           );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                      height: 60,
                      width: SizeConfig.screenWidth,
                      child:  Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                               children: [
                                Text.rich(
                                    TextSpan(
                                      text: 'TOTAL:',
                                      style:  TextStyle(
                                        color: Colors.blueGrey[50],
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      )
                                    )
                                   ),
                                 const SizedBox(width: 20,),  
                                Text.rich(
                                    TextSpan(
                                      text: '£ ${calculateTotalPrice(snapshot.data!)}',
                                      style:  TextStyle(
                                        color: Colors.blueGrey[50],
                                        fontSize: 18,
                                      )
                                    )
                                  ),
                               ],
                             ),
                    )
                  ],
                );
            },),
        )
      ],
    );
  }
}