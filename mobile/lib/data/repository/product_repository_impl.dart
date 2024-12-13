import 'package:deeplink_project_for_mr_group/core/repository/product_repository.dart';
import 'package:deeplink_project_for_mr_group/data/models/product/list_product_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/purchase/purchase_response.dart';
import 'package:deeplink_project_for_mr_group/data/network/api_service.dart';
import 'package:deeplink_project_for_mr_group/locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  final client = getIt<ApiService>();

  @override
  Future<ListProductResponse> getProducts() async {
    return await client.getProducts();
  }

  @override
  Future<PurchaseResponse> buyProduct(String productId) async {
    return await client.buyProduct(productId);
  }
}
