import '../../data/vos/product_vo/product_vo.dart';

abstract class ProductDataAgent{
  Future<List<ProductVO>?> getProductList();

  Future<ProductVO>? getProductDetails(int productID);
}