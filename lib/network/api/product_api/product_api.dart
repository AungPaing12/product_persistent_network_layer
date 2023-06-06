import 'package:dio/dio.dart';
import 'package:fake_store_persistent/constant/api_constant.dart';
import 'package:fake_store_persistent/data/vos/product_vo/product_vo.dart';
import 'package:retrofit/http.dart';

part 'product_api.g.dart';
@RestApi(baseUrl: kProductBaseURL)
abstract class ProductApi{

  factory ProductApi(Dio dio) => _ProductApi(dio);

  @GET(kProductEndPoint)
  Future<List<ProductVO>?> getProductResponse();

  @GET(kProductDetailEndPoint)
  Future<ProductVO>? getProductDetailResponse(
      @Path(kPathParameterProductID) int productID);
}


