import 'package:fake_store_persistent/constant/hive_constant.dart';
import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_persistent/persistent/product_dao.dart';
import 'package:hive/hive.dart';

class ProductDAOImpl extends ProductDAO {
  ProductDAOImpl._();

  static final ProductDAOImpl _singleton = ProductDAOImpl._();

  factory ProductDAOImpl() => _singleton;

  @override
  List<ProductVO> getProductListFromDataBase() => _productBox().values.toList();

  @override
  void save(List<ProductVO> productList) {
    for (ProductVO productVO in productList) {
      _productBox().put(productVO.id, productVO);
    }
  }

  Box<ProductVO> _productBox() => Hive.box<ProductVO>(kBoxNameForProductVO);

  @override
  Stream watchMovieBox() => _productBox().watch();

  @override
  Stream<List<ProductVO>?> getProductListFromDataBaseStream() =>
      Stream.value(getProductListFromDataBase());
}
