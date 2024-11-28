import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/widgets/ui/buttons/product_increment_widget.dart';
import 'package:flutter/material.dart';

class ProductClosedWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductClosedWidget({super.key,
  required this.productModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       color:Colors.white70,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Stack(
            alignment: Alignment.center,
             children: [
               Container(
                height: 120,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                  ),
                  image: DecorationImage(
                    image: Image.asset(productModel.productImage!).image,
                    fit: BoxFit.fill,
                    opacity: 0.6
                  ),
                  boxShadow:  [
                      BoxShadow(
                      offset:const Offset(0, 2),
                      blurRadius:8.0,
                      color:const Color(0xff000000).withOpacity(0.2),
                    ),
                  ]
                ),
               ),
               Center(
                 child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(left:10,right: 10),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            text: productModel.productTitle,
                            style:const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Open Sans',
                            ) )
                        )),
                    ),
                  ],
                               ),
               ),
             ],
           ),
          const SizedBox(height: 10),
         Container(
          margin: const EdgeInsets.only(top: 10),
          child: const WidgetIncrementProduct()
          ),
        ],
      ),
    );
  }
}