import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
   @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height   );
    var firstStartpoint = Offset(size.width/4 - size.width/8, size.height -60);
    var fistendpoint = Offset(size.width/4 + size.width/8, size.height -70);
    path.quadraticBezierTo(firstStartpoint.dx,  firstStartpoint.dy, fistendpoint.dx , fistendpoint.dy);


    var  secStartpoint = Offset(size.width/2 , size.height - 70);
    var  secEndpoint = Offset(size.width/2 + size.width / 8 , size.height - 50);
    path.quadraticBezierTo(secStartpoint.dx,  secStartpoint.dy, secEndpoint.dx , secEndpoint.dy);

    var  thirdStartpoint = Offset(3*(size.width/4) + size.width /8 , size.height -30);
    var  thirdEndpoint = Offset(size.width , size.height - 90);
    path.quadraticBezierTo(thirdStartpoint.dx,  thirdStartpoint.dy, thirdEndpoint.dx , thirdEndpoint.dy);

    path.lineTo(size.width , 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}