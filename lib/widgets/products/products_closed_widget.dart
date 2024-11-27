import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:fluro_test_application/widgets/UI/buttons/product_increment_widget.dart';
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
           Container(
            margin: const EdgeInsets.only(top: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset(productModel.productImage!).image,
                fit: BoxFit.fitHeight
              ),
              boxShadow:  [
                  BoxShadow(
                  offset:const Offset(0, 4),
                  blurRadius:4.0,
                  color:const Color(0xff000000).withOpacity(0.4),
                ),
              ]
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                         fontSize: 16,
                         color: Colors.black87
                      ) )
                  )),
              ),
            ],
          ),
         Container(
          margin: const EdgeInsets.only(top: 10),
          child: const WidgetIncrementProduct()
          ),
        ],
      ),
    );
  }
}