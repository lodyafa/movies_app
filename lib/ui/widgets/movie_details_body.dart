import 'package:flutter/material.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
  });

  // final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Image.network(
            // movie.posterPath ??
            // "https://photogora.ru/img/product/thumb/10524/15432413120.jpg",
            "https://avatars.mds.yandex.net/get-kinopoisk-post-img/1362954/1c3453100d0137063da650cc54479d85/960",
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          // movie.title ??
          "Spiderman far from home",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.date_range),
            SizedBox(width: 5),
            Text(
                // movie.releaseDate ??
                "2021"),
            SizedBox(width: 16),
            Text("|"),
            SizedBox(width: 16),
            Icon(Icons.access_time_rounded),
            SizedBox(width: 5),
            Text("148 min"),
            SizedBox(width: 16),
            Text("|"),
            SizedBox(width: 16),
            Icon(Icons.perm_device_info),
            SizedBox(width: 5),
            Text("Action"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text("About Movie"),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {},
              child: Text("Cast"),
            ),
            SizedBox(width: 10),
            TextButton(
              onPressed: () {},
              child: Text("Reviews"),
            ),
          ],
        ),
      ],
    );
  }
}
