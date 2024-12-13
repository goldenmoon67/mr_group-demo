import 'package:deeplink_project_for_mr_group/data/network/errors/api_error.dart';

class ExceptionUtils {
  static String? handleException(ex, stacktrace) {
    String? message;
    if (ex is ApiError) {
      message = ex.errorModel.message;
    } else {
      message = ex.toString();
    }

    return message;
  }
}
