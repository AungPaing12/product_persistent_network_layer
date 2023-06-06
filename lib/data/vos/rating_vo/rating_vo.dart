import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';

import '../../../constant/hive_constant.dart';
part 'rating_vo.g.dart';
@HiveType(typeId: kRatingVOTypeID)
@JsonSerializable()
class RatingVO {
  @HiveField(0)
  @JsonKey(name: 'rate')
  double? rate;

  @HiveField(1)
  @JsonKey(name: 'count')
  int? count;

  RatingVO({this.rate, this.count});

  @override
  String toString() {
    return 'RatingVO{rate: $rate, count: $count}';
  }

  factory RatingVO.fromJson(Map<String, dynamic> json) => _$RatingVOFromJson(json);
}