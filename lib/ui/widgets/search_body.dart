import 'package:flutter/material.dart';
import 'package:movies_app/data/dummy_data.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final movie = movies[index];
        return ListTile(
          contentPadding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movies[index].title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            // Обработчик нажатия
          },
        );
      },
      separatorBuilder: (context, _) {
        return const SizedBox(
          height: 0,
        );
      },
      itemCount: movies.length,
    );
  }
}

class Characteristics extends StatelessWidget {
  const Characteristics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.star_rate,
          color: Colors.white,
        ),
        Text(
          "9.5",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
