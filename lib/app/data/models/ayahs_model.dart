class Ayahs {
  String? text;
  int? numberInSurah;

  Ayahs({this.text, this.numberInSurah});

  Ayahs.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    numberInSurah = json['numberInSurah'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['numberInSurah'] = numberInSurah;
    return data;
  }

  @override
  String toString() {
    return 'text: $text, numberInSurah: $numberInSurah';
  }
}
