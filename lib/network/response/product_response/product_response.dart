import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/product_vo/product_vo.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  List<ProductVO>? productList;

  ProductResponse(this.productList);

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
