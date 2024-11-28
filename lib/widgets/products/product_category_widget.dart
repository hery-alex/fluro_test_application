import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductCategoryWidget({super.key,required  this.productModel});


  // Widget getCategoryIcon(){
    
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child:const Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: 'Category :',
                  style:  TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 30),
                )
                ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}