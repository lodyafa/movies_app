import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';

class MovieExtraInfo extends StatelessWidget {
  const MovieExtraInfo({
    super.key,
    required this.runtime,
    required this.releaseDate,
    // required this.productionCountries,
    required this.genres,
    required this.voteAverage,
  });

  final int? runtime;
  final String? releaseDate;
  // final List<ProductionCountry> productionCountries;
  final List<Genre> genres;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    String releaseDateString;
    if (releaseDate == null) {
      releaseDateString = "Unknown date";
    } else {
      DateTime date = DateTime.parse(releaseDate!);
      releaseDateString = "${date.year}";
    }

    // String productionCountriesString = "";
    // if (productionCountries.isEmpty) {
    //   productionCountriesString = "None";
    // } else {
    //   for (int i = 0; i < productionCountries.length; i++) {
    //     if (productionCountries[i].iso_3166_1 == null ||
    //         productionCountries[i].iso_3166_1!.isEmpty) continue;
    //     productionCountriesString += productionCountries[i].iso_3166_1!;
    //     if (i + 1 < productionCountries.length) {
    //       productionCountriesString += ", ";
    //     }
    //   }
    // }

    String genresString = "";
    for (int i = 0; i < genres.length; i++) {
      if (genres[i].name == null || genres[i].name!.isEmpty) continue;
      genresString += genres[i].name!;
      if (i + 1 < genres.length) genresString += ", ";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.calendar_month),
            const SizedBox(width: 5),
            Text(releaseDateString),
            const SizedBox(width: 10),
            const Text("|"),
            const SizedBox(width: 10),
            const Icon(Icons.watch_later_sharp),
            const SizedBox(width: 5),
            Text("${runtime.toString()} min"),
            const SizedBox(width: 10),
            const Text("|"),
            const SizedBox(width: 10),
            Icon(
              Icons.star,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 5),
            Text(
              voteAverage,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // const SizedBox(width: 20),
            // const Icon(Icons.public),
            // const SizedBox(width: 5),
            // Text(productionCountriesString),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          genresString,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
