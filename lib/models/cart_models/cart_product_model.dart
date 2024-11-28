import 'package:fluro_test_application/models/product_model/product_model.dart';

class CartProductModel {


  CartProductModel({
    this.productChosen,
    this.productQuantity,
    this.totalPriceForProduct
  });

  ProductModel? productChosen;
  int? productQuantity;
  double? totalPriceForProduct;
  
 

 CartProductModel copyWith({
   ProductModel? productChosen,
  int? productQuantity,
  double? totalPriceForProduct
 }){
  return CartProductModel(
     productChosen : productChosen ?? productChosen,
     productQuantity: productQuantity ?? productQuantity,
     totalPriceForProduct : totalPriceForProduct ?? totalPriceForProduct
  );
 }

   @override
  bool operator ==(Object other) =>
      other is CartProductModel &&
      productChosen == other.productChosen &&
      productQuantity == other.productQuantity &&
      totalPriceForProduct == other.totalPriceForProduct;

  @override
  int get hashCode => Object.hash(
        productChosen,
        productQuantity,
        totalPriceForProduct,
      );

}