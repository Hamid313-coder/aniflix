import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/repositories/movies.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_widget.dart';
import 'package:flutter_anime_flix/resources/widgets/shimmer.dart';

class AllMovieScreen extends StatefulWidget {
  final Map<String, dynamic> gnere;

  const AllMovieScreen({Key? key, required this.gnere}) : super(key: key);

  @override
  _AllMovieScreenState createState() => _AllMovieScreenState();
}

class _AllMovieScreenState extends State<AllMovieScreen> {
  late ScrollController gridController = ScrollController();
  final moviesRepo = MovieRepositories();
  List<Map<String, dynamic>> moveis = [];
  bool isLoading = true;
  bool init = true;

  @override
  void initState() {
    moviesRepo.getMoviesById(widget.gnere["id"]).then((value) {
      moveis = value;
      setState(() => isLoading = false);
    });
    super.initState();
  }

  @override
  void dispose() {
    gridController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.gnere["name"],
            style: TextStyles.primaryTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.builder(
            controller: gridController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.6,
            ),
            itemCount: (isLoading) ? 7 : moveis.length,
            itemBuilder: (context, index) => (isLoading)
                ? LoaderWidget.rectangular(
                    height: size.height * 0.3,
                  )
                : MovieWidget(
                    movie: moveis[index],
                    recommendedMovies: moveis,
                  ),
          ),
        ));
  }
}
