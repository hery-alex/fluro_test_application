
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
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/cart');
                  },
                  child:  Container(
                    margin: const EdgeInsets.all(10),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black87,
                        width: 1
                      ),
                       boxShadow:  [
                          BoxShadow(
                          offset:const Offset(0, 4),
                          blurRadius:4.0,
                          color:const Color(0xff000000).withOpacity(0.4),
                        ),
                        ]
                    ),
                    child:  Icon(
                      Icons.shopping_cart,
                      size: 25,
                      color: Colors.blueGrey[900],
                    ),
                  ),
                 )
              ],
            ),
          ),
      ),
  );
  }

   @override
  Size get preferredSize => const Size.fromHeight(140);
}