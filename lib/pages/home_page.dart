import 'package:fake_store_persistent/data/model/product_model/product_model.dart';
import 'package:fake_store_persistent/data/model/product_model/product_model_impl.dart';
import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';
import 'package:flutter/material.dart';

import '../view_item/home_page_view_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductModel _productModel = ProductModelImpl();
  ProductVO? productVO;
  List<ProductVO> _productList = [];
  //NoData State ======> Existing State
  @override
  void initState() {
    ///Fetch Network Call and Save to Database
    _productModel.getProductList();

    ///Listen Database Event
    _productModel.getProductListFormDataBase().listen((event) {
      if (mounted) {
        setState(() {
          _productList = event ?? [];
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(Icons.menu),
        title: const Text("Product"),
      ),
      body: _productList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: _productList
                    .map((e) => ProductItemView(
                          productVO: e,
                          productID: productVO?.id ?? 0,
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
