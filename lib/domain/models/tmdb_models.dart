abstract class TMDBModel {}

class MovieModel extends TMDBModel {
  final bool? adult;
  final int? id;
  final String? backdropPath;
  final dynamic budget;
  final String? homepage;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final String? releaseDate;
  final dynamic revenue;
  final dynamic runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final dynamic voteAverage;
  final int? voteCount;

  MovieModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.homepage,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      budget: json["budget"],
      homepage: json["homepage"],
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      revenue: json["revenue"],
      runtime: json["runtime"],
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }
}

class SeriesModel extends TMDBModel {
  final int? id;
  final bool? adult;
  final String? backdropPath;
  // final List<int>? genreIds;
  // final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final dynamic popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final dynamic voteAverage;
  final int? voteCount;
  final dynamic episodeRunTime;

  SeriesModel({
    this.id,
    this.adult,
    this.backdropPath,
    // this.genreIds,
    // this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
    this.episodeRunTime,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // genreIds: json['genre_ids'],
      id: json['id'],
      // originCountry: json['origin_country'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      firstAirDate: json['first_air_date'],
      name: json['name'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      episodeRunTime: json["episode_run_time"],
    );
  }
}

class PersonModel extends TMDBModel {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? originalName;
  String? overview;
  String? profilePath;
  String? mediaType;
  // List<int>? genredynamic
  dynamic popularity;
  String? firstAirDate;
  dynamic voteAverage;
  dynamic voteCount;
  // List<String>? originCountry;
  String? title;
  String? originalTitle;
  String? releaseDate;
  bool? video;

  PersonModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.name,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.profilePath,
      this.mediaType,
      // this.genreIds,
      this.popularity,
      this.firstAirDate,
      this.voteAverage,
      this.voteCount,
      // this.originCountry,
      this.title,
      this.originalTitle,
      this.releaseDate,
      this.video});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      name: json['name'],
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      profilePath: json['profile_path'],
      mediaType: json['media_type'],
      // genreIds = json['genre_ids'].cast<int>();
      popularity: json['popularity'],
      firstAirDate: json['first_air_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      // originCountry: json['origin_country'].cast<String>(),
      title: json['title'],
      originalTitle: json['original_title'],
      releaseDate: json['release_date'],
      video: json['video'],
    );
  }
}

class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  // Null? belongsToCollection;
  dynamic budget;
  // List<Genres>? genres;
  String? homepage;
  dynamic id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  dynamic popularity;
  String? posterPath;
  // List<ProductionCompanies>? productionCompanies;
  // List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  // List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  dynamic voteAverage;
  dynamic voteCount;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    // this.belongsToCollection,
    this.budget,
    // this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    // this.productionCompanies,
    // this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    // this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // belongsToCollection = json['belongs_to_collection'];
      budget: json['budget'],
      // if (json['genres'] != null) {
      //   genres = <Genres>[];
      //   json['genres'].forEach((v) {
      //     genres!.add(new Genres.fromJson(v));
      //   });
      // }
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      // if (json['production_companies'] != null) {
      //   productionCompanies = <ProductionCompanies>[];
      //   json['production_companies'].forEach((v) {
      //     productionCompanies!.add(new ProductionCompanies.fromJson(v));
      //   });
      // }
      // if (json['production_countries'] != null) {
      //   productionCountries = <ProductionCountries>[];
      //   json['production_countries'].forEach((v) {
      //     productionCountries!.add(new ProductionCountries.fromJson(v));
      //   });
      // }
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      // if (json['spoken_languages'] != null) {
      //   spokenLanguages = <SpokenLanguages>[];
      //   json['spoken_languages'].forEach((v) {
      //     spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      //   });
      // }
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class SeriesDetailsModel {
  bool? adult;
  String? backdropPath;
  // List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  // List<Genres>? genres;
  String? homepage;
  dynamic id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  // LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  // Null? nextEpisodeToAir;
  // List<Networks>? networks;
  dynamic numberOfEpisodes;
  dynamic numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  dynamic popularity;
  String? posterPath;
  // List<ProductionCompanies>? productionCompanies;
  // List<ProductionCountries>? productionCountries;
  // List<Seasons>? seasons;
  // List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  dynamic voteAverage;
  dynamic voteCount;

  SeriesDetailsModel(
      {this.adult,
      this.backdropPath,
      // this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      // this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      // this.lastEpisodeToAir,
      this.name,
      // this.nextEpisodeToAir,
      // this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      // this.productionCompanies,
      // this.productionCountries,
      // this.seasons,
      // this.spokenLanguages,
      this.status,
      this.tagline,
      this.type,
      this.voteAverage,
      this.voteCount});

  factory SeriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return SeriesDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      // if (json['created_by'] != null) {
      //   createdBy = <CreatedBy>[];
      //   json['created_by'].forEach((v) {
      //     createdBy!.add(new CreatedBy.fromJson(v));
      //   });
      // }
      episodeRunTime: json['episode_run_time'].cast<int>(),
      firstAirDate: json['first_air_date'],
      // if (json['genres'] != null) {
      //   genres = <Genres>[];
      //   json['genres'].forEach((v) {
      //     genres!.add(new Genres.fromJson(v));
      //   });
      // }
      homepage: json['homepage'],
      id: json['id'],
      inProduction: json['in_production'],
      languages: json['languages'].cast<String>(),
      lastAirDate: json['last_air_date'],
      // lastEpisodeToAir = json['last_episode_to_air'] != null
      //     ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
      //     : null;
      name: json['name'],
      // nextEpisodeToAir = json['next_episode_to_air'];
      // if (json['networks'] != null) {
      //   networks = <Networks>[];
      //   json['networks'].forEach((v) {
      //     networks!.add(new Networks.fromJson(v));
      //   });
      // }
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      originCountry: json['origin_country'].cast<String>(),
      originalLanguage: json['original_language'],
      originalName: json['original_name'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      // if (json['production_companies'] != null) {
      //   productionCompanies = <ProductionCompanies>[];
      //   json['production_companies'].forEach((v) {
      //     productionCompanies!.add(new ProductionCompanies.fromJson(v));
      //   });
      // }
      // if (json['production_countries'] != null) {
      //   productionCountries = <ProductionCountries>[];
      //   json['production_countries'].forEach((v) {
      //     productionCountries!.add(new ProductionCountries.fromJson(v));
      //   });
      // }
      // if (json['seasons'] != null) {
      //   seasons = <Seasons>[];
      //   json['seasons'].forEach((v) {
      //     seasons!.add(new Seasons.fromJson(v));
      //   });
      // }
      // if (json['spoken_languages'] != null) {
      //   spokenLanguages = <SpokenLanguages>[];
      //   json['spoken_languages'].forEach((v) {
      //     spokenLanguages!.add(new SpokenLanguages.fromJson(v));
      //   });
      // }
      status: json['status'],
      tagline: json['tagline'],
      type: json['type'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class PersonDetailsModel {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  // Null? deathday;
  dynamic gender;
  // Null? homepage;
  dynamic id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  dynamic popularity;
  String? profilePath;

  PersonDetailsModel(
      {this.adult,
      this.alsoKnownAs,
      this.biography,
      this.birthday,
      // this.deathday,
      this.gender,
      // this.homepage,
      this.id,
      this.imdbId,
      this.knownForDepartment,
      this.name,
      this.placeOfBirth,
      this.popularity,
      this.profilePath});

  factory PersonDetailsModel.fromJson(Map<String, dynamic> json) {
    return PersonDetailsModel(
    adult: json['adult'],
    alsoKnownAs: json['also_known_as'].cast<String>(),
    biography: json['biography'],
    birthday: json['birthday'],
    // deathday = json['deathday'];
    gender: json['gender'],
    // homepage = json['homepage'];
    id: json['id'],
    imdbId: json['imdb_id'],
    knownForDepartment: json['known_for_department'],
    name: json['name'],
    placeOfBirth: json['place_of_birth'],
    popularity: json['popularity'],
    profilePath: json['profile_path'],
    );
  }
}
