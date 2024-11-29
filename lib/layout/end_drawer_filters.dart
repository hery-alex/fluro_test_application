import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/states/products/products_provider.dart';
import 'package:fluro_test_application/widgets/ui/filters/filters_row_widget.dart';
import 'package:flutter/material.dart';

class EndDrawerFilter extends StatelessWidget  {
  const EndDrawerFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[400],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8)
        ) 
      ),
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth! / 2,
      child: Column(
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
                      size: 30,
                      color: Colors.blueGrey[50],
                    ),
                    const SizedBox(width: 10,),
                    Text.rich(
                      TextSpan(
                        text: 'Slide Back',
                        style:  TextStyle(
                          color: Colors.blueGrey[50],
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Open Sans'
                        )
                      )
                    ),
                  ],
                ),
            ),
            ),
            Container(
            padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Filters'.toUpperCase(),
                        style:  TextStyle(
                          color: Colors.blueGrey[50],
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Open Sans'
                        )
                      )
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                      onTap: (){
                        ProductsProvider.of(context)!.products.addFilter('Reset');
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 30,
                         color: Colors.blueGrey[50],
                      ),
                    )
                  ],
                ),
            ),
            Container(
            padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child: Column(
              children: [
                FiltersRowWidget(imageIcon: FluroImageAssets.croissantIcon,filterText: 'Croissant',),
                const SizedBox(height: 10,),
                FiltersRowWidget(imageIcon: FluroImageAssets.muffinIcon,filterText: 'Muffin',),
                const SizedBox(height: 10,),
                FiltersRowWidget(imageIcon: FluroImageAssets.brownieIcon,filterText: 'Brownie',),
                const SizedBox(height: 10,),
                FiltersRowWidget(imageIcon: FluroImageAssets.cakeIcon,filterText: 'Cake',),
                const SizedBox(height: 10,),
                FiltersRowWidget(imageIcon: FluroImageAssets.cupcakeIcon,filterText: 'Cupcakes',),
              ],
            ),
            ),
        ],
      ),
    );
  }
}