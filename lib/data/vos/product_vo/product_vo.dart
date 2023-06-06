import 'package:fake_store_persistent/data/vos/rating_vo/rating_vo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import '../../../constant/hive_constant.dart';


part 'product_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: kProductVOTypeID)
class ProductVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;

  @JsonKey(name: 'price')
  @HiveField(2)
  double? price;

  @JsonKey(name: 'description')
  @HiveField(3)
  String? description;

  @JsonKey(name: 'category')
  @HiveField(4)
  String? category;

  @JsonKey(name: 'image')
  @HiveField(5)
  String? image;

  @JsonKey(name: 'rating')
  @HiveField(6)
  RatingVO? rating;

  ProductVO({this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating});
  

  factory ProductVO.fromJson(Map<String, dynamic> json) => _$ProductVOFromJson(json);
}