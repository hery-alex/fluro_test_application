import 'package:fluro_test_application/DATA_Layer/models/product_model/product_model.dart';

class CartProductModel {


  CartProductModel({
    this.productChosen,
    this.productQuantity,
    this.totalPriceForProduct,
    this.listProducts,
  });

  ProductModel? productChosen;
  int? productQuantity;
  double? totalPriceForProduct;
  List<ProductModel>? listProducts;
  
  
 

 CartProductModel copyWith({
   ProductModel? productChosen,
  int? productQuantity,
  double? totalPriceForProduct,
  List<ProductModel>? listProducts
 }){
  return CartProductModel(
     productChosen : productChosen ?? this.productChosen,
     productQuantity: productQuantity ?? this.productQuantity,
     totalPriceForProduct : totalPriceForProduct ?? this.totalPriceForProduct,
     listProducts :listProducts ?? this.listProducts
  );
 }

   @override
  bool operator ==(Object other) =>
      other is CartProductModel &&
      productChosen == other.productChosen &&
      productQuantity == other.productQuantity &&
      totalPriceForProduct == other.totalPriceForProduct && 
      listProducts == other.listProducts;

  @override
  int get hashCode => Object.hash(
        productChosen,
        productQuantity,
        totalPriceForProduct,
        listProducts
      );

}