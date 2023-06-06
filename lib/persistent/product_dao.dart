import '../data/vos/product_vo/product_vo.dart';

abstract class ProductDAO{

  void save (List<ProductVO> productList);

  List<ProductVO>? getProductListFromDataBase();

  Stream watchMovieBox();

  Stream<List<ProductVO>?> getProductListFromDataBaseStream();
}