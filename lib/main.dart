import 'package:fake_store_persistent/data/model/product_model/product_model.dart';
import 'package:fake_store_persistent/data/model/product_model/product_model_impl.dart';
import 'package:fake_store_persistent/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant/hive_constant.dart';
import 'data/vos/product_vo/product_vo.dart';
import 'data/vos/rating_vo/rating_vo.dart';

ProductModel _productModel = ProductModelImpl();

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProductVOAdapter());
  Hive.registerAdapter(RatingVOAdapter());
  await Hive.openBox<ProductVO>(kBoxNameForProductVO);
  await Hive.openBox<ProductVO>(kBoxNameForRatingVO);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
