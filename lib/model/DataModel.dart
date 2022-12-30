// class DataModel {
//   DataModel({
//       this.productTitle,
//       this.quantity,
//       this.productId,
//       this.productVariationId,
//       this.productVariationPrice,
//       this.productTax,
//       this.categoryId,
//       this.productImages,
//       this.attributes,});
//
//   DataModel.fromJson(dynamic json) {
//     productTitle = json['product_title'];
//     quantity = json['quantity'];
//     productId = json['product_id'];
//     productVariationId = json['product_variation_id'];
//     productVariationPrice = json['product_variation_price'];
//     productTax = json['product_tax'];
//     categoryId = json['category_id'];
//     productImages = json['product_images'] != null ? json['product_images'].cast<String>() : [];
//     attributes = json['attributes'];
//   }
//   String ?productTitle;
//   int ?quantity;
//   String ?productId;
//   String ?productVariationId;
//   String ?productVariationPrice;
//   String ?productTax;
//   String ?categoryId;
//   List<String> ?productImages;
//   String ?attributes;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['product_title'] = productTitle;
//     map['quantity'] = quantity;
//     map['product_id'] = productId;
//     map['product_variation_id'] = productVariationId;
//     map['product_variation_price'] = productVariationPrice;
//     map['product_tax'] = productTax;
//     map['category_id'] = categoryId;
//     map['product_images'] = productImages;
//     map['attributes'] = attributes;
//     return map;
//   }
//
// }