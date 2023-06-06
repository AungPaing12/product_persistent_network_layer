import 'package:flutter/material.dart';

import '../data/vos/product_vo/product_vo.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.productVO}) : super(key: key);
  final ProductVO? productVO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(productVO?.title ?? '',),
              background: Image.network(productVO?.image ?? '',fit: BoxFit.cover,),
            ),
          )
        ],
        body: SingleChildScrollView(
          child: SizedBox(
            width: 150,
            height: 700,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return  Card(
                      color: Colors.grey,
                      child: Text(productVO?.description ?? ''),
                  );
                },

            ),
          )
        ),
      ),
    );
  }
}
