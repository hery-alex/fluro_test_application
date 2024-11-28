import 'package:fluro_test_application/mixins/mixin_product_category.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductCategoryWidget extends StatelessWidget with MixinProductCategory {
  final ProductModel productModel;
  const ProductCategoryWidget({super.key,required  this.productModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: 'Category :',
                  style:  TextStyle(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 30),
                )
                ),
                ),
              ),
               getCategoryIcon(productModel),
            ],
          ),
    );
  }
}