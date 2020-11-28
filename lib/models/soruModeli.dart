import 'dart:convert';

List<Soru> soruFromJson(String str) =>
    List<Soru>.from(json.decode(str).map((x) => Soru.fromJson(x)));

String soruToJson(List<Soru> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Soru {
  Soru({
    this.soruMetni,
    this.soruCevabi,
  });

  String soruMetni;
  bool soruCevabi;

  factory Soru.fromJson(Map<String, dynamic> json) => Soru(
        soruMetni: json["soru_metni"],
        soruCevabi: json["soru_cevabi"],
      );

  Map<String, dynamic> toJson() => {
        "soru_metni": soruMetni,
        "soru_cevabi": soruCevabi,
      };
}
