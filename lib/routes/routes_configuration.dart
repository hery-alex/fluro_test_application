import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/layout/layout_with_background.dart';
import 'package:fluro_test_application/screens/products_list/products_list_view.dart';
import 'package:fluro_test_application/screens/shopping_cart/shopping_cart_view.dart';
import 'package:flutter/material.dart';


abstract class RouteConfig{
   Widget checkRoutePath(RouteSettings settings);
}

class RoutesConfiguration implements RouteConfig{

  @override
  Widget checkRoutePath(RouteSettings settings){
     switch(settings.name!){
      case '/':
        return   LayoutForBackground(
          showAppBarr: true,
          child: const ProductsListView(),
        );
      case '/cart': 
        return LayoutForBackground(
          showAppBarr: false,
          backgroundImage: FluroImageAssets.cartViewBackgroundImage,
          child: const ShoppingCartView()
          );  
      default : 
        return const SizedBox();    
    }

  }

  
 static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
       pageBuilder: (context,animation1, animation2){
                SizeConfig().init(context);
         return RoutesConfiguration().checkRoutePath(settings);
       },
       transitionsBuilder: (_,anim,__,child){
           const begin = Offset(1.0, 0.0);
           const end = Offset.zero;
           const curve = Curves.ease;
  
           var tween =  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  
           return SlideTransition(
             position: anim.drive(tween),
             child: child,
           );
       }
    );
  }
}