import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'https://requestcatcher.com';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  /// POST /login
  Future<Response> sendLogin({
    required String email,
    required String password,
  }) async {
    return await _dio.post(
      '/login',
      data: {
        'action': 'login',
        'email': email,
        'password': password,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// POST /signup
  Future<Response> sendSignup({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _dio.post(
      '/signup',
      data: {
        'action': 'signup',
        'name': name,
        'email': email,
        'password': password,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  /// POST /reset
  Future<Response> sendResetPassword({
    required String email,
  }) async {
    return await _dio.post(
      '/reset',
      data: {
        'action': 'reset_password',
        'email': email,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
}
