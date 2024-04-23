import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/custom_lists.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_details_title.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_extra_info.dart';

class SeriesDetailsLoadedBody extends StatelessWidget {
  const SeriesDetailsLoadedBody({
    super.key,
    required this.series,
    required this.seriesActors,
    required this.seriesList,
  });

  final SeriesModel series;
  final List<SeriesModel> seriesList;
  final List<PersonModel> seriesActors;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        SizedBox(
          height: 350,
          child: Stack(
            children: [
              Column(
                children: [
                  ImageFormatter.formatImageWidget(
                    context,
                    imagePath: series.backdropPath,
                    height: 250,
                    width: double.infinity,
                  ),
                  SeriesDetailsTitle(seriesTitle: series.name),
                ],
              ),
              Positioned(
                top: 160,
                left: 30,
                child: ImageFormatter.formatImageWidget(
                  context,
                  imagePath: series.posterPath,
                  height: 180,
                  width: 120,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SeriesExtraInfo(
            releaseDate: series.firstAirDate,
            numberOfEpisodes: series.numberOfEpisodes,
            numberOfSeasons: series.numberOfSeasons,
            genres: series.genres ?? [],
            voteAverage: series.voteAverage.toStringAsFixed(1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                series.overview ?? "none",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              Text(
                "Cast",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: ActorsListView(
                  actors: seriesActors,
                  cardWidth: 140,
                  cardHeight: 210,
                ),
              ),
              Text(
                "Similar Series",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 256,
                width: double.infinity,
                child: SeriesListView(
                  series: seriesList,
                  cardWidth: 140,
                  cardHeight: 210,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
