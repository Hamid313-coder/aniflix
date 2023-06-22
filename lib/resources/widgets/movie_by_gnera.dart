import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/repositories/movies.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_widget.dart';
import 'package:flutter_anime_flix/resources/widgets/shimmer.dart';

class MovieByGnera extends StatefulWidget {
  final String gnera;
  final int id;
  const MovieByGnera({
    Key? key,
    required this.gnera,
    required this.id,
  }) : super(key: key);

  @override
  _MovieByGneraState createState() => _MovieByGneraState();
}

class _MovieByGneraState extends State<MovieByGnera>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;

  List<Map<String, dynamic>> movies = [];

  final moviesRepo = MovieRepositories();

  @override
  void initState() {
    super.initState();
    isLoading = true;

    moviesRepo.getMoviesById(widget.id).then((value) {
      movies = value;
      movies.shuffle();
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              widget.gnera,
              style: TextStyles.primaryTitle,
            ),
          ),
          SizedBox(
            height: size.height * 0.24,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: isLoading ? 5 : movies.length,
                itemBuilder: (context, index) {
                  return isLoading
                      ? LoaderWidget.rectangular(
                          height: size.height * 0.22,
                          width: size.width * 0.32,
                        )
                      : MovieWidget(
                          movie: movies[index],
                          recommendedMovies: movies,
                        );
                }),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
