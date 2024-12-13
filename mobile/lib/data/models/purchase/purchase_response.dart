import 'package:deeplink_project_for_mr_group/data/models/purchase/purchase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_response.freezed.dart';
part 'purchase_response.g.dart';

@freezed
class PurchaseResponse with _$PurchaseResponse {
  const factory PurchaseResponse({
    required String message,
    required Purchase purchase,
  }) = _PurchaseResponse;

  factory PurchaseResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseResponseFromJson(json);
}
