import 'package:flutter_interview_test/core/base/api_response.dart';

abstract class UseCase<T> {
  Future<ApiResponse<T>> run();
}
