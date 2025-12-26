import 'package:flutter/material.dart';
import 'package:isaprog_mainsite/core/models/data_responce_model.dart';
import 'package:isaprog_mainsite/core/models/info_reponse_model.dart';
import 'package:isaprog_mainsite/core/services/api_service.dart';

class MainProvider extends ChangeNotifier {
  bool isLoading = false;
  DataListResponse siteDatas = DataListResponse(datas: []);
  InfoPageListResponse infoPageDatas = InfoPageListResponse(datas: []);

  Future<void> loadData() async {
    try {
      isLoading = true;
      siteDatas = await ApiService().getMainDataFromAPI();
      infoPageDatas = await ApiService().getInfoDataFromAPI();
      notifyListeners();
    } catch (_) {}
    isLoading = false;
    notifyListeners();
  }
}
