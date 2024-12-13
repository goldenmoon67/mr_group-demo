import 'package:deeplink_project_for_mr_group/data/models/product/list_product_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/purchase/purchase_response.dart';

abstract class ProductRepository {
  Future<ListProductResponse> getProducts();
  Future<PurchaseResponse> buyProduct(String productId);
}
