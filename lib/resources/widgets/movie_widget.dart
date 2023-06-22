import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/detail_bottom_sheet.dart';

class MovieWidget extends StatelessWidget {
  final Map<String, dynamic> movie;
  final List<Map<String, dynamic>> recommendedMovies;
  const MovieWidget(
      {Key? key, required this.movie, required this.recommendedMovies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return DetailBottomSheet(
            movie: movie,
            recommendedMovies: recommendedMovies,
          );
        },
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        width: size.width * 0.32,
        height: size.height * 0.22,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/${movie["poster_path"]}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
