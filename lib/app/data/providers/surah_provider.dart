import 'package:get/get.dart';

import '../models/surah_model.dart';

class SurahProvider extends GetConnect {
  Future<List<Surah>> getAllSurah() async {
    final response = await get('http://api.alquran.cloud/v1/surah');
    List<dynamic> responseBody = response.body['data'];
    List<Surah> listSurah = responseBody.map((item) => Surah.fromJson(item)).toList();
    return listSurah;
  }

  Future<Surah> getSurah(int index) async {
    final response = await get('http://api.alquran.cloud/v1/surah/$index');
    Surah surah = Surah.fromJson(response.body['data']);
    return surah;
  }

  Future<List<Surah>> get4Surah(List<int> listIndex) async {
    List<Surah> listSurah = [];
    for (var i = 0; i < listIndex.length; i++) {
      Surah temp = await getSurah(listIndex[i]);
      listSurah.add(temp);
    }

    return listSurah;
  }
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return Surah.fromJson(map);
  //     if (map is List) return map.map((item) => Surah.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = 'http://api.alquran.cloud/v1';
  // }

  // Future<Surah?> getSurah(int id) async {
  //   final response = await get('surah/$id');
  //   return response.body;
  // }

  // Future<Response<Surah>> postSurah(Surah surah) async => await post('surah', surah);
  // Future<Response> deleteSurah(int id) async => await delete('surah/$id');
}
