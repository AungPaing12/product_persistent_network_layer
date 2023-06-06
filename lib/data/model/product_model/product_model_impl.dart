import 'package:fake_store_persistent/data/model/product_model/product_model.dart';
import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_persistent/network/data_agent/product_data_agent.dart';
import 'package:fake_store_persistent/network/data_agent/product_data_agent_impl.dart';
import 'package:fake_store_persistent/persistent/product_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../persistent/product_dao.dart';

class ProductModelImpl extends ProductModel {
  ProductModelImpl._();

  static final ProductModelImpl _singleton = ProductModelImpl._();

  factory ProductModelImpl() => _singleton;

  final ProductDataAgent _productDataAgent = ProductDataAgentImpl();
  final ProductDAO _productDAO = ProductDAOImpl();

  @override
  Future<List<ProductVO>?> getProductList() =>
      _productDataAgent.getProductList().then((value) {
        if (value != null) {
          _productDAO.save(value);
        }
        return value;
      });

  @override
  Future<ProductVO>? getProductDetails(int productID) =>
      _productDataAgent.getProductDetails(productID);

  @override
  Stream<List<ProductVO>?> getProductListFormDataBase() => _productDAO
      .watchMovieBox()
      .startWith(_productDAO.getProductListFromDataBaseStream())
      .map((event) => _productDAO.getProductListFromDataBase());
}
