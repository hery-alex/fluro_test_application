
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductOpenWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductOpenWidget({super.key,
  required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 250,
                  height: 250,
                  margin: EdgeInsets.only(top: SizeConfig.safeBlockVertical! * 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                    image:DecorationImage(
                    image: Image.asset(productModel.productImage!).image,
                    fit: BoxFit.fitHeight,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}