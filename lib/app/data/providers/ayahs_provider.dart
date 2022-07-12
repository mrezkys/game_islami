import 'package:get/get.dart';

import '../models/ayahs_model.dart';

class AyahsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Ayahs.fromJson(map);
      if (map is List) return map.map((item) => Ayahs.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Ayahs?> getAyahs(int id) async {
    final response = await get('ayahs/$id');
    return response.body;
  }

  Future<Response<Ayahs>> postAyahs(Ayahs ayahs) async =>
      await post('ayahs', ayahs);
  Future<Response> deleteAyahs(int id) async => await delete('ayahs/$id');
}
