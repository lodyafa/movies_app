import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_details_title.dart';
import 'package:movies_app/ui/widgets/series_details_widgets/series_extra_info.dart';

class SeriesDetailsLoadedBody extends StatelessWidget {
  const SeriesDetailsLoadedBody({
    super.key,
    required this.series,
    required this.seriesActors,
  });

  final SeriesModel series;
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
                  Container(
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.background,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 160, right: 25),
                      child: SeriesDetailsTitle(
                        seriesTitle: series.name,
                      ),
                    ),
                  ),
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SeriesExtraInfo(
            releaseDate: series.firstAirDate,
            numberOfEpisodes: series.numberOfEpisodes,
            numberOfSeasons: series.numberOfSeasons,
            genres: series.genres ?? [],
            voteAverage: series.voteAverage.toStringAsFixed(1),
          ),
        )
      ],
    );
  }
}
