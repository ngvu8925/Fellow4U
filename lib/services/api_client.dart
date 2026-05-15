import 'package:dio/dio.dart';

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.fellow4u.com/v1', // Mock URL
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static Dio get instance => _dio;

  // For simulation/testing purposes, we can add interceptors here
  static void init() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add auth token if available
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        // Handle global errors
        return handler.next(e);
      },
    ));
  }
}
