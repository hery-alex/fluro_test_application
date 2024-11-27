import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutForBackground extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  const LayoutForBackground({super.key,required this.child,required this.showBackButton});

  @override
  Widget build(BuildContext context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor:  Color(0xffffffff),
    ),
    child: SafeArea(
      child: Scaffold(
      appBar:showBackButton ? AppBar(
          backgroundColor: Colors.black87,
          leading:  IconButton(
            color: Colors.white,
            icon:const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ) ,
        ): null,
        body:SafeArea(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              color: Colors.black87,
              image:DecorationImage(
                image: FluroImageAssets.layoutBackgroundImage,
                fit: BoxFit.cover,
                opacity: 0.2,
              ),
            ),
            child: child,
          ),
        ),
       ),
    ),
    );
  }
}