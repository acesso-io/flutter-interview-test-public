import 'package:dio/dio.dart';
import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/types.dart';
import 'package:flutter_interview_test/data/drivers/http_driver.dart';

class HttpMethod {
  static final String GET = 'GET';
  static final String POST = 'POST';
}

class HttpDriverImpl implements HttpDriver {
  final String baseUrl;

  HttpDriverImpl(this.baseUrl);

  Dio get _dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
        ),
      );

  @override
  Future<ApiResponse<T>> request<T>({
    required String method,
    required String endpoint,
    required Mapper<T> mapper,
    dynamic data,
    JsonObject? queryParams,
  }) async {
    try {
      final response = await _dio.request(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
      return ApiResponse<T>.success(mapper(response.data));
    } on Exception catch (e) {
      return ApiResponse<T>.error(e);
    } catch (_) {
      return ApiResponse<T>.error(null);
    }
  }
}
