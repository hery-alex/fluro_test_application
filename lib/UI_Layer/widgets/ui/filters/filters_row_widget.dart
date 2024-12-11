import 'package:fluro_test_application/LOGIC_Layer/states/products/products_provider.dart';
import 'package:flutter/material.dart';

class FiltersRowWidget extends StatelessWidget {
  final ImageProvider<Object> imageIcon;
  final String filterText;
  const FiltersRowWidget({super.key,required this.imageIcon,required this.filterText});

  @override
  Widget build(BuildContext context) {
    return   StreamBuilder<Object>(
      stream: ProductsProvider.of(context)!.products.filterStream,
      builder: (context, snapshot) {

        return InkWell(
                  onTap: ()=> ProductsProvider.of(context)!.products.addFilter(filterText),
                  child: Container(
                    height: 60,
                    padding:const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: snapshot.data != null && snapshot.data == filterText ? Colors.blueAccent : Colors.blueGrey[100],
                      borderRadius:const BorderRadius.all(Radius.circular(20)),
                      boxShadow:const [
                         BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius:4.0,
                          color: Color(0xff000000),
                        ),
                      ]
                    ),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: imageIcon,width: 25,height:25,),
                          const SizedBox(width: 10,),
                          Text.rich(
                            TextSpan(
                              text: filterText,
                              style:  TextStyle(
                                color: Colors.blueGrey[900],
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Open Sans'
                              )
                            )
                          ),
                        ],
                    ),
                  ),
                );
      }
    );
  }
}