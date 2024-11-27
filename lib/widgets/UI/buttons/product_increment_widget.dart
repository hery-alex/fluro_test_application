import 'package:fluro_test_application/widgets/UI/buttons/add_button.dart';
import 'package:flutter/material.dart';

class WidgetIncrementProduct extends StatefulWidget {
  const WidgetIncrementProduct({super.key});

  @override
  State<WidgetIncrementProduct> createState() => _WidgetIncrementProductState();
}

class _WidgetIncrementProductState extends State<WidgetIncrementProduct> {

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
          child: const AddToCartButton()),
        ],
      ),
    );
  }
}