
import 'package:fluro_test_application/config/size_config.dart';
import 'package:fluro_test_application/widgets/ui/ui_clippers/wave_clipper.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
    preferredSize:preferredSize, // Set this height
    child: ClipPath(
            clipper: WaveClipper(),
           child:  Container(
            width: SizeConfig.screenWidth,
            color: Colors.orange,
          ),
      ),
  );
  }

   @override
  Size get preferredSize => const Size.fromHeight(140);
}