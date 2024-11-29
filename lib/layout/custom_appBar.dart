
import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/models/cart_models/cart_product_model.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:fluro_test_application/widgets/ui/ui_clippers/wave_clipper.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
   final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomAppbar({super.key,required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
    preferredSize:preferredSize, // Set this height
    child: ClipPath(
            clipper: WaveClipper(),
           child:  Container(
            width: SizeConfig.screenWidth,
            color: Colors.blueGrey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                     InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed('/cart');
                      },
                      child:  Container(
                        margin: const EdgeInsets.all(12),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey[50],
                          border: Border.all(
                            color: Colors.black87,
                            width: 1
                          ),
                           boxShadow:  [
                              BoxShadow(
                              offset:const Offset(0, 4),
                              blurRadius:4.0,
                              color:const Color(0xff000000).withOpacity(0.4),
                            ),
                          ]
                        ),
                        child:  Container(
                          padding: const EdgeInsets.all(5),
                          child: Image(image: FluroImageAssets.cartIcon,)
                          )
                      
                      ),
                     ),
                     StreamBuilder(
                     stream: CartProvider.of(context)!.cart.cartProductsList, 
                     builder:(context,AsyncSnapshot<List<CartProductModel>> snapshot) {
                        int productLength = 0;
                        if(snapshot.data != null){
                          for(var specificData in snapshot.data!){
                             productLength = specificData.productQuantity! + productLength;
                          }
                        }
                
                        return Positioned(
                          left: 2,
                          top: 0,
                          child: Text.rich(
                            TextSpan(
                              text: '${productLength > 10 ? '10+' : productLength}',
                              style:const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              )
                            )
                          ),
                        );
                     })
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top:12,bottom: 12,right: 30,left: 0),
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueGrey[50],
                            border: Border.all(
                              color: Colors.black87,
                              width: 1
                            ),
                             boxShadow:  [
                                BoxShadow(
                                offset:const Offset(0, 4),
                                blurRadius:4.0,
                                color:const Color(0xff000000).withOpacity(0.4),
                              ),
                            ]
                          ),
                          child:  Container(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.filter_list,
                              size: 40,
                              color: Colors.blueGrey[900],
                            )
                            )
                        
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
      ),
  );
  }

   @override
  Size get preferredSize => const Size.fromHeight(140);
}