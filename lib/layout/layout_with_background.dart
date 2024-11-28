import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/layout/custom_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutForBackground extends StatelessWidget {
  final Widget child;
  final bool showAppBarr;
  final ImageProvider<Object>? backgroundImage;
  const LayoutForBackground({super.key,required this.child,required this.showAppBarr,this.backgroundImage});

  @override
  Widget build(BuildContext context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor:  Color(0xffffffff),
    ),
    child: SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:SafeArea(
          child: Stack(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight!,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  image:DecorationImage(
                    image:backgroundImage ?? FluroImageAssets.layoutBackgroundImage,
                    fit: BoxFit.cover,
                    opacity: 0.2,
                  ),
                ),
                child: child,
              ),
             if(showAppBarr) 
              const SizedBox(
                height: 120,
                child: CustomAppbar()
              ),
            ],
          ),
        ),
       ),
    ),
    );
  }
}