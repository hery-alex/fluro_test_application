import 'package:flutter/material.dart';

class CartPromotionModel {
  
  CartPromotionModel({
    this.productQuantity,
    this.totalPriceForProduct,
    this.promotionDescription,
    this.imageIcon,
    this.promotionCode,
  });

  int? productQuantity;
  double? totalPriceForProduct;
  String? promotionDescription;
  ImageProvider<Object>? imageIcon;
  int? promotionCode;
}