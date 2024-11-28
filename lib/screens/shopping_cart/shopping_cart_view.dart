import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:flutter/material.dart';

class ShoppingCartView extends StatelessWidget {
  const ShoppingCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
         width: SizeConfig.screenWidth,
         height: 80,
        ),
        Container(
          height: SizeConfig.screenHeight! / 2.2,
          width: SizeConfig.screenWidth,
          color: Colors.blueGrey,
          child: StreamBuilder(
            stream: CartProvider.of(context)!.cart.cartProductsList, 
            builder:(context,AsyncSnapshot<List<CartProductModel>> snapshot) {
                if(!snapshot.hasData){
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Cart is empty'
                        )
                      )
                    ],
                  );
                }

                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder:(context, index) {
                      
                       return Text.rich(
                        TextSpan(
                          text: '${snapshot.data![index].productChosen!.productTitle}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )
                        )
                       );
                    },
                  ),
                );
            },),
        )
      ],
    );
  }
}