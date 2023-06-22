import 'package:flutter/material.dart';

class RecommendedMovies extends StatefulWidget {
  final int movieId;

  const RecommendedMovies({
    Key? key,
    required this.movieId,
  }) : super(key: key);

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
        return Container();

        // const MovieWidget(
        //     // anime: ap.recommended[index],
        //     );
      },
      itemCount: 7,
    );
  }
}
