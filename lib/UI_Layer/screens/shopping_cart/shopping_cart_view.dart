import 'package:fluro_test_application/UI_Layer/assets/assets_images.dart';
import 'package:fluro_test_application/LOGIC_Layer/config/size_config.dart';
import 'package:fluro_test_application/LOGIC_Layer/states/cart/cart_provider.dart';
import 'package:fluro_test_application/UI_Layer/screens/shopping_cart/shopping_cart_produtcts.dart';
import 'package:fluro_test_application/UI_Layer/screens/shopping_cart/shopping_cart_promotions.dart';
import 'package:fluro_test_application/UI_Layer/widgets/promotions/promotions_information.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget{
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
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                CartProvider.of(context)!.cart.addListToStream([]);
                CartProvider.of(context)!.cart.addPromotions([]);
              },
              child: Icon(
                Icons.refresh,
                size: 30,
                  color: Colors.blueGrey[50],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async{
                       await showDialog<bool>(
                          context: context,
                          builder: (context) => const PromotionInformation(),
                        );
                    },
                    child: Icon(
                      Icons.info_rounded,
                      size: 30,
                        color: Colors.blueGrey[50],
                    ),
                  ),
                ],
              ),
            )
          ],
         ),
        ),
        const ShoppingCartProdutcts(),
        const ShoppingCartPromotions()
       ],
    );
  }
}