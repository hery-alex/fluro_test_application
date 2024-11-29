import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:flutter/material.dart';

class PromotionInformation extends StatelessWidget {
  const PromotionInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        decoration:const BoxDecoration(
         color: Colors.blueGrey,
         borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        height: 200,
        child: Column(
          children: [
           Container(
            padding:const EdgeInsets.all(10),
            child:  Text.rich(
              textAlign: TextAlign.left,
                  TextSpan(
                    text: 'Promotions Available',
                    style:  TextStyle(
                      color: Colors.blueGrey[50],
                      fontSize: 18,
                    )
                  )
                ),
           ),
           const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                      flex: 10,
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image:FluroImageAssets.muffinIcon,width: 25,height:25,),
                            const SizedBox(width: 10,),
                            Text.rich(
                            TextSpan(
                              text: '2 for £ 1.25',
                              style:  TextStyle(
                                color: Colors.blueGrey[50],
                                fontSize: 16,
                              )
                            )
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                      flex: 10,
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image:FluroImageAssets.brownieIcon,width: 25,height:25,),
                            const SizedBox(width: 10,),
                            Text.rich(
                            TextSpan(
                              text: 'Buy 3, get one free',
                              style:  TextStyle(
                                color: Colors.blueGrey[50],
                                fontSize: 16,
                              )
                            )
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                      flex: 10,
                        child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image:FluroImageAssets.croissantIcon,width: 25,height:25,),
                            Text.rich(
                             TextSpan(
                              text: '+',
                              style:  TextStyle(
                                color: Colors.blueGrey[50],
                                fontSize: 16,
                              )
                             )
                            ),
                             Image(image:FluroImageAssets.cupcakeIcon,width: 25,height:25,),
                            const SizedBox(width: 10,),
                            Text.rich(
                            TextSpan(
                              text: 'Meal Deal for £ 3.00',
                              style:  TextStyle(
                                color: Colors.blueGrey[50],
                                fontSize: 16,
                              )
                            )
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
            ),
          ],
        ),
      ),
    );
  }
}