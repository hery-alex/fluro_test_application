import 'package:animations/animations.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/states/products/products_provider.dart';
import 'package:fluro_test_application/widgets/products/products_closed_widget.dart';
import 'package:fluro_test_application/widgets/products/products_open_widget.dart';
import 'package:flutter/material.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      width: SizeConfig.screenWidth,
      child: StreamBuilder<Object>(
        stream: ProductsProvider.of(context)!.products.productsList,
        builder: (context, AsyncSnapshot productsDataList) {
          if(!productsDataList.hasData){
            return const CircularProgressIndicator();
          }
          return GridView.builder(
            itemCount: productsDataList.data.length,
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 4/6
              ), 
            itemBuilder: (context,int index){
               
               return OpenContainer(
                    closedColor: Colors.transparent,
                    openColor: Colors.transparent,
                    transitionType: ContainerTransitionType.fadeThrough,
                    transitionDuration:const Duration(milliseconds: 500),
                    closedElevation: 0,
                    closedBuilder: (context, action) {
                      return ProductClosedWidget(productModel: productsDataList.data[index]);
                    },
                    openBuilder: (context,action){
                      return  ProductOpenWidget(productModel: productsDataList.data[index]);
                    }
                  );
          
            });
        }
      ),
    );
  }
}