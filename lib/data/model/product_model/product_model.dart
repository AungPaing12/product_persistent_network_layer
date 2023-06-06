import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';

abstract class ProductModel{

  Future<List<ProductVO>?> getProductList();

  Future<ProductVO>? getProductDetails(int productID);

  Stream<List<ProductVO>?> getProductListFormDataBase();

}