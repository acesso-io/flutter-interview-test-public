class ApiResponse<T> {
  final T? data;
  final Exception? error;
  final bool isSuccess;

  ApiResponse._({
    this.data,
    this.error,
    required this.isSuccess,
  });

  factory ApiResponse.success(T? data) => ApiResponse._(
        data: data,
        isSuccess: true,
      );

  factory ApiResponse.error(Exception? error) => ApiResponse._(
        error: error,
        isSuccess: false,
      );
}
