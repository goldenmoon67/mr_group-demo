import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase.freezed.dart';
part 'purchase.g.dart';

@freezed
class Purchase with _$Purchase {
  const factory Purchase({
    required String userId,
    required double amount,
    required bool firstPurchase,
  }) = _Purchase;

  factory Purchase.fromJson(Map<String, dynamic> json) =>
      _$PurchaseFromJson(json);
}
