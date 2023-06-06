import 'package:dio/dio.dart';
import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';
import 'package:fake_store_persistent/network/data_agent/product_data_agent.dart';

import '../api/product_api/product_api.dart';

class ProductDataAgentImpl extends ProductDataAgent {
  late ProductApi _api;

  ProductDataAgentImpl._() {
    _api = ProductApi(Dio());
  }

  static final ProductDataAgentImpl _singleton = ProductDataAgentImpl._();

  factory ProductDataAgentImpl() => _singleton;


  @override
  Future<List<ProductVO>?> getProductList() => _api.getProductResponse();

  @override
  Future<ProductVO>? getProductDetails(int productID) => _api.getProductDetailResponse(productID);


}
