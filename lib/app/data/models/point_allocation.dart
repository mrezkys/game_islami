class PointAllocation {
  final int sambungAyat;
  final int sambungAyatRandom;
  final int tebakSurah;

  PointAllocation({
    required this.sambungAyat,
    required this.sambungAyatRandom,
    required this.tebakSurah,
  });

  factory PointAllocation.fromJson(Map<String, dynamic> json) {
    return PointAllocation(
      sambungAyat: json['sambung_ayat'],
      sambungAyatRandom: json['sambung_ayat_random'],
      tebakSurah: json['tebak_surah'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sambung_ayat'] = sambungAyat;
    data['sambung_ayat_random'] = sambungAyatRandom;
    data['tebak_surah'] = tebakSurah;
    return data;
  }

  @override
  String toString() {
    return 'sambungAyat: $sambungAyat,sambungAyatRandom: $sambungAyatRandom,tebakSurah: $tebakSurah,';
  }
}
