import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
         print('Got pushed');
      } ,
      child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blueGrey,
          border: Border.all(
             color: Colors.black87,
          ),
          boxShadow:  [
                  BoxShadow(
                  offset:const Offset(0, 2),
                  blurRadius:4.0,
                  color:const Color(0xff000000).withOpacity(0.4),
                ),
              ]
        ),
        padding: const EdgeInsets.symmetric(vertical: 1),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
            Icons.trolley,
              color: Colors.white,
              size: 12,
            ),
            SizedBox(
              width: 2,
            ),
            Text('Add to cart',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      );
  }
}