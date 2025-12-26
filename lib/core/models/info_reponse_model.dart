class InfoPageListResponse {
  final List<InfoPageResponseModel> datas;

  InfoPageListResponse({required this.datas});

  factory InfoPageListResponse.fromJson(List<dynamic> json) {
    return InfoPageListResponse(
      datas: json
          .map((orderJson) => InfoPageResponseModel.fromJson(orderJson))
          .toList(),
    );
  }
}

class InfoPageResponseModel {
  final int id;
  final String headertext;
  final String bodytext;

  InfoPageResponseModel({
    required this.id,
    required this.headertext,
    required this.bodytext,
  });

  factory InfoPageResponseModel.fromJson(Map<String, dynamic> json) {
    return InfoPageResponseModel(
      id: json['id'] ?? 0,
      headertext: json['headertext'] ?? "",
      bodytext: json['bodytext'] ?? "",
    );
  }
}
