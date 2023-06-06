import 'package:flutter/material.dart';
import '../data/vos/product_vo/product_vo.dart';
import '../pages/detail_page.dart';

class ProductItemView extends StatelessWidget {
  const ProductItemView({Key? key, required this.productVO, required this.productID }) : super(key: key);
  final ProductVO? productVO;
  final int productID;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Card(
        color: Colors.white70,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                  productVO: productVO,
                )));
          },
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage:
            NetworkImage(productVO?.image ?? ''),
          ),
          title: Text(productVO?.title ?? ''),
          subtitle: Text(productVO?.description ?? ''),
          isThreeLine: true,
          trailing: SizedBox(
            width: 100,
            height: 20,
            child: Row(
             children: [
               const Icon(Icons.price_change),
               const SizedBox(width: 10,),
               Text('${productVO?.price ?? 0}'),
             ],
            ),
          ),
        ),
      ),
    );
  }
}
