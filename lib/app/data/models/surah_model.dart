import 'package:game_islami/app/data/models/ayahs_model.dart';

class Surah {
  int? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  int? numberOfAyahs;
  String? revelationType;
  List<Ayahs?>? listAyahs;

  Surah({this.listAyahs, this.number, this.name, this.englishName, this.englishNameTranslation, this.numberOfAyahs, this.revelationType});

  Surah.fromJson(Map<String, dynamic> json) {
    getListAyah() {
      try {
        return (json['ayahs'] as List).map((data) => Ayahs.fromJson(data)).toList();
      } catch (e) {
        return null;
      }
    }

    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
    listAyahs = getListAyah();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelationType'] = revelationType;
    return data;
  }

  @override
  String toString() {
    return "[number : $number, name: $name, ayahs: $listAyahs, englishName: $englishName, englishNameTranslation: $englishNameTranslation, numberOfAyahs: $numberOfAyahs, revelationType: $revelationType]";
  }
}
