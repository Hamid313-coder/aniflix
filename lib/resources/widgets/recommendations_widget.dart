import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_widget.dart';

class RecommendedMovies extends StatefulWidget {
  final List<Map<String, dynamic>> recommendedMovies;

  const RecommendedMovies({Key? key, required this.recommendedMovies})
      : super(key: key);

  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return MovieWidget(
          movie: widget.recommendedMovies[index],
          recommendedMovies: widget.recommendedMovies,
        );
      },
      itemCount: widget.recommendedMovies.length,
    );
  }
}
