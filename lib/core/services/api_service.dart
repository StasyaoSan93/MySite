import 'package:isaprog_mainsite/core/app_config.dart';
import 'package:isaprog_mainsite/core/models/data_responce_model.dart';
import 'package:isaprog_mainsite/core/models/info_reponse_model.dart';
import 'package:isaprog_mainsite/core/services/dio_service.dart';

class ApiService {
  // Синглтон
  static final ApiService _shared = ApiService._sharedInstance();
  ApiService._sharedInstance();
  factory ApiService() => _shared;

  // Полученние данных основной страницы
  Future<DataListResponse> getMainDataFromAPI() async {
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

  // Полученние данных страницы info
  Future<InfoPageListResponse> getInfoDataFromAPI() async {
    try {
      final response = await DioService().apiHelper(
        apiMethod: ApiMethod.get,
        url: AppConfig.getAllInfoPageDataDataRoute,
      );
      InfoPageListResponse data = InfoPageListResponse.fromJson(response.data);
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
