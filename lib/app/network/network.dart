import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:saberion_assessment/app/config/keys.dart'
;

@singleton
class Network {

  Network();

  Dio? _dio;

  @PostConstruct(preResolve: true)
  Future<void> initialize() async {
    _dio = Dio(BaseOptions(
      baseUrl:baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));
  }

  Future<Response> post(String url, Object? data) =>
      _dio!.post(url, data: data);

  Future<Response> get(String url, Map<String, String> params) =>
      _dio!.get(url, queryParameters: params);

  Future<Response> put(String url, Object? data) => _dio!.put(url, data: data);

  Future<Response<T>> request<T>(String url, String method, data) async {
    final response = await _dio!.request<T>(
      url,
      data: data,
      options: Options(method: method),
    );

    return response;
  }
}
