import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/models/tmdb_models.dart';
import 'package:movies_app/ui/blocs/all_media_bloc/all_media_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/utils/image_formatter.dart';
import 'package:movies_app/ui/widgets/media_card_widget.dart';

class AllMediaLoadedBody extends StatefulWidget {
  const AllMediaLoadedBody({
    super.key,
    required this.queryType,
    required this.page,
    required this.models,
    required this.hasReachedMax,
  });

  final ApiMediaQueryType queryType;
  final List<TMDBModel> models;
  final int page;
  final bool hasReachedMax;

  @override
  State<AllMediaLoadedBody> createState() => _AllMediaLoadedBodyState();
}

class _AllMediaLoadedBodyState extends State<AllMediaLoadedBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AllMediaBloc>().add(
            AllMediaLoadNewMediaEvent(
              queryType: widget.queryType,
              page: widget.page + 1,
            ),
          );
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final bool isBottom = currentScroll >= (maxScroll * 0.9);
    return isBottom;
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: GridView.builder(
        key: ValueKey(widget.queryType),
        controller: _scrollController,
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.8 / 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 25,
        ),
        itemCount: widget.hasReachedMax
            ? widget.models.length
            : widget.models.length + 1,
        itemBuilder: (context, i) {
          if (i >= widget.models.length) {
            return const RepaintBoundary(
              child: Center(
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          final model = widget.models[i];

          if (model is MovieModel) {
            return GestureDetector(
              onTap: () {
                context.push(
                  "${AppRoutes.home}/${AppRoutes.allMedia}/${AppRoutes.movieDetails}/${model.id}",
                  extra: [model.id, model.title],
                );
              },
              child: MediaCardWidget(
                textWidth: 180,
                key: ValueKey(model.id),
                width: 180,
                image: ImageFormatter.formatImageWidget(
                  context,
                  imagePath: model.posterPath,
                  height: 230,
                  width: 130,
                ),
                title: model.title ?? "Unknown movie",
              ),
            );
          } else if (model is SeriesModel) {
            return GestureDetector(
              onTap: () {
                context.push(
                  "${AppRoutes.home}/${AppRoutes.allMedia}/${AppRoutes.seriesDetails}/${model.id}",
                  extra: [model.id, model.name],
                );
              },
              child: MediaCardWidget(
                textWidth: 180,
                key: ValueKey(model.id),
                width: 180,
                image: ImageFormatter.formatImageWidget(
                  context,
                  imagePath: model.posterPath,
                  height: 230,
                  width: 130,
                ),
                title: model.name ?? "Unknown series",
              ),
            );
          } else if (model is PersonModel) {
            return GestureDetector(
              onTap: () {
                context.push(
                  "${AppRoutes.home}/${AppRoutes.allMedia}/${AppRoutes.personDetails}/${model.id}",
                  extra: [model.id, model.name],
                );
              },
              child: MediaCardWidget(
                textWidth: 180,
                key: ValueKey(model.id),
                width: 180,
                image: ImageFormatter.formatImageWidget(
                  context,
                  imagePath: model.posterPath,
                  height: 230,
                  width: 130,
                ),
                title: model.name ?? "Unknown person",
              ),
            );
          } else {
            return const SizedBox(
              height: 210,
              width: 140,
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
