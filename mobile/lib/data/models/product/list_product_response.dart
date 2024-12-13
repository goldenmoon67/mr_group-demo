import 'package:deeplink_project_for_mr_group/data/models/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_product_response.freezed.dart';
part 'list_product_response.g.dart';

@freezed
class ListProductResponse with _$ListProductResponse {
  const factory ListProductResponse({
    required List<Product> products,
  }) = _ListProductResponse;

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductResponseFromJson(json);
}
