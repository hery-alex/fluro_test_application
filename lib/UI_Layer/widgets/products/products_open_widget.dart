
import 'package:fluro_test_application/UI_Layer/assets/assets_images.dart';
import 'package:fluro_test_application/LOGIC_Layer/config/size_config.dart';
import 'package:fluro_test_application/DATA_Layer/models/product_model/product_model.dart';
import 'package:fluro_test_application/UI_Layer/widgets/products/product_category_widget.dart';
import 'package:fluro_test_application/UI_Layer/widgets/ui/buttons/product_increment_widget.dart';
import 'package:flutter/material.dart';

class ProductOpenWidget extends StatelessWidget {
  final ProductModel productModel;
  const ProductOpenWidget({super.key,
  required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: FluroImageAssets.openContainerBackgroundImage,
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
         color: Colors.blueGrey[200],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.only( 
                     bottomLeft: Radius.elliptical(300, 150),
                     bottomRight: Radius.elliptical(300, 150)  
                    ),
                    image:DecorationImage(
                    image: Image.asset(productModel.productImage!).image,
                    fit: BoxFit.fill,
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
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: '${productModel.productTitle}',
                    style:  TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 40),
                  )
                ),
              ),
                const SizedBox(height: 20,),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                   child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: '£ ${double.parse('${productModel.productPrice! / 100}').toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Open Sans',
                      ) )
                                   ),
                 ),
               const SizedBox(height: 20,),
               ProductCategoryWidget(productModel: productModel,), 
               const SizedBox(height: 20,),
                Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Text.rich(
                      textAlign: TextAlign.start,
                      TextSpan(
                        text: '    ${productModel.productDescription}',
                        style:  TextStyle(
                          color: Colors.grey[850],
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Open Sans',
                          fontSize: 16),
                      )
                      ),
                      ),
                    ),
                  ],
                ),
                Container(
                width: SizeConfig.screenWidth! / 2,
                margin: const EdgeInsets.only(top: 10),
                child:  WidgetIncrementProduct(productModel: productModel,)
                ),
                const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}