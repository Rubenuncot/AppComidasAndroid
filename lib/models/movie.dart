import 'dart:convert';

class Movie {
    Movie({
        required this.adult,
        this.backdropPath,
        required this.genreIds,
        required this.id,
        this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        this.posterPath,
        this.releaseDate,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    String? heroId;
    bool adult;
    String? backdropPath;
    List<int> genreIds;
    int id;
    OriginalLanguage? originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String? posterPath;
    String? releaseDate;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
    get fullBackdropUrl => 'https://image.tmdb.org/t/p/w500${backdropPath ?? posterPath}';

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );
}

enum OriginalLanguage { EN, ES }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "es": OriginalLanguage.ES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}