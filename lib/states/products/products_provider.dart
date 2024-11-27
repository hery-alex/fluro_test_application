
import 'package:fluro_test_application/states/products/products_stream.dart';
import 'package:flutter/material.dart';



class ProductsProvider extends InheritedWidget{


  final ProductsStream products;

  ProductsProvider({super.key,Widget? child})
  : products =  ProductsStream.startWithData(),
    super(child: child!);

  @override
  bool updateShouldNotify(ProductsProvider oldWidget){
    return true;
  }

  static ProductsProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ProductsProvider>();
  }
}