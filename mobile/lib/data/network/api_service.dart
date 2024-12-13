import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/login/login_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/register/register_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/auth/token/refresh_token_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/coupon/coupon_request.dart';
import 'package:deeplink_project_for_mr_group/data/models/product/list_product_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/purchase/purchase_response.dart';
import 'package:deeplink_project_for_mr_group/data/models/user/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @POST("/auth/register")
  Future<void> register(@Body() RegisterRequest request);
  @POST("/auth/login")
  Future<LoginResponse> login(@Body() LoginRequest request);

  @GET("/users/session-user")
  Future<User> sessionUser();

  @POST("/auth/refresh")
  Future<RefreshTokenResponse> refreshToken(
      @Body() RefreshTokenRequest request);

  @GET("/products")
  Future<ListProductResponse> getProducts();

  @POST("/purchases/{productId}")
  Future<PurchaseResponse> buyProduct(
    @Path("productId") String productId,
  );

  @POST("/users/use-coupon")
  Future<void> useCoupon(@Body() CouponRequest request);
}
