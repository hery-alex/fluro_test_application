
class ProductModel{

String? productTitle;
String? productDescription;
String? productSKU;
double? productPrice;
String? productImage;
String? productCategory;


ProductModel.fromJson(Map<String,dynamic> json)
 : productTitle = json['productTitle'],
   productDescription = json['productDescription'],
   productSKU = json['productSKU'],
   productPrice = double.parse(json['productPrice']),
   productImage  = json['productImage'],
   productCategory = json['productCategory'];


 Map<String,dynamic> toMap(){
    final Map<String,dynamic> data = <String,dynamic>{};
    data['productTitle'] = productTitle;
    data['productDescription'] = productDescription;
    data['productSKU'] = productSKU;
    data['productPrice'] = productPrice;
    data['productImage'] = productImage;
    data['productCategory'] = productCategory;
    return data;
   } 






}