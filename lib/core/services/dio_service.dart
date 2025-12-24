import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:isaprog_mainsite/core/app_config.dart';
import 'package:isaprog_mainsite/core/utils/toast_helper.dart';

enum ApiMethod { post, get, put, del }

class DioService {
  // Синглтон
  static final DioService _shared = DioService._sharedInstance();
  DioService._sharedInstance();
  factory DioService() => _shared;

  // Работа с АПИ (первоначальные настройки)
  static final Dio dio = Dio(BaseOptions(baseUrl: AppConfig.apiUrl));

  final options = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.noCache,
    hitCacheOnErrorCodes: [401, 403],
    maxStale: const Duration(minutes: 5),
    priority: CachePriority.normal,
  );

  bool _isInitialized = false;

  Future<void> _init() async {
    if (_isInitialized) return;

    await createDioInstance();

    _isInitialized = true;
  }

  Future<void> createDioInstance() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          // Перехват 500-х ошибок
          final status = error.response?.statusCode ?? 0;
          if (status >= 500 && status <= 504) {
            ToastHelper.show("Сервер временно недоступен. Повторяем запрос...");
            // retry один раз
            try {
              final response = await dio.fetch(error.requestOptions);
              return handler.resolve(response);
            } catch (_) {}
          }
          // CORS или другие ошибки
          if (error.type == DioExceptionType.connectionError) {
            ToastHelper.show("Ошибка соединения. Проверьте CORS или интернет.");
          }
          return handler.next(error);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
      ),
    );
    dio.interceptors.add(DioCacheInterceptor(options: options));
  }

  // Работа с АПИ
  Future<Response<dynamic>> apiHelper({
    required ApiMethod apiMethod,
    required String url,
    Map<String, dynamic>? data,
  }) async {
    try {
      await _init();
      late Response<dynamic> response;
      switch (apiMethod) {
        case ApiMethod.post:
          response = await dio.post(url, data: data);
          break;
        case ApiMethod.get:
          response = await dio.get(url, data: data);
          break;
        case ApiMethod.put:
          response = await dio.put(url, data: data);
          break;
        case ApiMethod.del:
          response = await dio.delete(url, data: data);
          break;
      }
      return response;
    } catch (error) {
      handleError(error);
      rethrow;
    }
  }

  // Обработка ошибок для единообразного возврата сообщения об ошибке
  String handleError(dynamic error) {
    if (error is DioException) {
      ToastHelper.show(
        'API Error [${error.response?.statusCode ?? '000'}] ${error.response?.data == '' ? '' : ': ${error.response?.data['errors']}'}',
      );
      return 'API Error: ${error.response?.statusCode ?? '000'}';
    } else {
      ToastHelper.show('Unexpected error: $error');
      return 'Unexpected error: $error';
    }
  }
}
