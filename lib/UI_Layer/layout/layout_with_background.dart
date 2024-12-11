import 'package:fluro_test_application/UI_Layer/assets/assets_images.dart';
import 'package:fluro_test_application/LOGIC_Layer/config/size_config.dart';
import 'package:fluro_test_application/UI_Layer/layout/custom_appBar.dart';
import 'package:fluro_test_application/UI_Layer/layout/end_drawer_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LayoutForBackground extends StatelessWidget {
  final Widget child;
  final bool showAppBarr;
  final ImageProvider<Object>? backgroundImage;
  LayoutForBackground({super.key,required this.child,required this.showAppBarr,this.backgroundImage});
  

  final GlobalKey<ScaffoldState> _key = GlobalKey();


  @override
  Widget build(BuildContext context) {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor:  Colors.blueGrey,
    ),
    child: SafeArea(
      child: Scaffold(
        key: _key,
        endDrawerEnableOpenDragGesture: true,
        endDrawer:const EndDrawerFilter(),
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
               SizedBox(
                height: 120,
                child: CustomAppbar(scaffoldKey: _key,)
              ),
            ],
          ),
        ),
       ),
    ),
    );
  }
}