import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/types.dart';

abstract class HttpDriver {
  Future<ApiResponse<T>> request<T>({
    required String method,
    required String endpoint,
    required Mapper<T> mapper,
    dynamic data,
    JsonObject? queryParams,
  });
}
