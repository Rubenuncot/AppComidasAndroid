import 'dart:convert';

import 'package:comidas/models/models.dart';

class CastProvider {
    CastProvider({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory CastProvider.fromRawJson(String str) => CastProvider.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CastProvider.fromJson(Map<String, dynamic> json) => CastProvider(
        id: json["id"] ?? 0,
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromJson(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
    };
}