import 'package:fluro_test_application/assets/assets_images.dart';
import 'package:fluro_test_application/mixins/mixin_helper_for_product_increment.dart';
import 'package:fluro_test_application/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class WidgetIncrementProduct extends StatefulWidget {
  final ProductModel productModel;
  const WidgetIncrementProduct({super.key,required this.productModel});

  @override
  State<WidgetIncrementProduct> createState() => _WidgetIncrementProductState();
}

class _WidgetIncrementProductState extends State<WidgetIncrementProduct> with HelperFunctionsProductIncrementWidget {

 int startUpNumber = 0;


 void incrementNumber(){
   setState(() {
     startUpNumber = startUpNumber +1;
   });
 }

 void decreaseNumber(){
  if(startUpNumber >0){
    setState(() {
     startUpNumber = startUpNumber - 1;
   });
  }
 }

  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: decreaseNumber,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration:const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)
                        ),
                    ),
                    child:const Icon(
                      Icons.exposure_minus_1,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: const EdgeInsets.all(5),
                 decoration: const BoxDecoration(
                  color: Colors.white,
                 ),
                 child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: startUpNumber.toString(),
                  )
                 ),
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap:incrementNumber,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                     decoration:const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                        ),
                    ),
                    child: const Icon(
                      Icons.plus_one,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
         Container(
          height: 40,
          margin: const EdgeInsets.only(top: 20),
          child: InkWell(
            onTap:(){
              addProductToCart(widget.productModel,startUpNumber);
              setState(() {
                startUpNumber = 0;
              });
            },
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
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SizedBox(
                  width: 20,
                  height: 20,
                  child: Image(image: FluroImageAssets.cartIcon,)
                  ),
                 const SizedBox(
                    width: 2,
                  ),
                 const Text('Add to cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            )),
        ],
      ),
    );
  }
}