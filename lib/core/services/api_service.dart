import 'package:isaprog_mainsite/core/app_config.dart';
import 'package:isaprog_mainsite/core/models/data_responce_model.dart';
import 'package:isaprog_mainsite/core/services/dio_service.dart';

class ApiService {
  // Синглтон
  static final ApiService _shared = ApiService._sharedInstance();
  ApiService._sharedInstance();
  factory ApiService() => _shared;

  // Полученние токена из АПИ (авторизация)
  Future<DataListResponse> getTokenFromAPI() async {
    try {
      final response = await DioService().apiHelper(
        apiMethod: ApiMethod.get,
        url: AppConfig.getAllDataRoute,
      );
      DataListResponse data = DataListResponse.fromJson(response.data);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
