
import 'package:fluro_test_application/LOGIC_Layer/states/cart/cart_stream.dart';
import 'package:flutter/material.dart';



class CartProvider extends InheritedWidget{

  final CartStream cart;

  CartProvider({super.key,Widget? child})
  : cart =  CartStream(),
    super(child: child!);

  @override
  bool updateShouldNotify(CartProvider oldWidget){
    return true;
  }

  static CartProvider? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }
}