class DataListResponse {
  final List<DataResponseModel> datas;

  DataListResponse({required this.datas});

  factory DataListResponse.fromJson(List<dynamic> json) {
    return DataListResponse(
      datas: json
          .map((orderJson) => DataResponseModel.fromJson(orderJson))
          .toList(),
    );
  }
}

class DataResponseModel {
  final int id;
  final String headertext;
  final String bodytext;
  final String imageurl;
  final String siteurl;

  DataResponseModel({
    required this.id,
    required this.headertext,
    required this.bodytext,
    required this.imageurl,
    required this.siteurl,
  });

  factory DataResponseModel.fromJson(Map<String, dynamic> json) {
    return DataResponseModel(
      id: json['id'] ?? 0,
      headertext: json['headertext'] ?? "",
      bodytext: json['bodytext'] ?? "",
      imageurl: json['imageurl'] ?? "",
      siteurl: json['siteurl'] ?? "",
    );
  }
}
