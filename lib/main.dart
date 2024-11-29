import 'package:fluro_test_application/routes/routes_configuration.dart';
import 'package:fluro_test_application/states/cart/cart_provider.dart';
import 'package:fluro_test_application/states/products/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  runApp(const FluroCheckoutApplication());
}


class FluroCheckoutApplication extends StatelessWidget {
  const FluroCheckoutApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductsProvider(
      child: CartProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fluro Test',
          initialRoute: '/',
          onGenerateRoute: (settings) => RoutesConfiguration.onGenerateRoute(settings),
        ),
      ),
    );
  }
}