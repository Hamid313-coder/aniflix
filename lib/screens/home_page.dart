import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/repositories/movies.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/button.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_by_gnera.dart';
import 'package:flutter_anime_flix/resources/widgets/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = true;

  List<Map<String, dynamic>> movies = [];

  final moviesRepo = MovieRepositories();

  @override
  void initState() {
    super.initState();
    // isLoading = true;

    moviesRepo.getMoviesById(genres[0]["id"]).then((value) {
      movies = value;
      movies.shuffle();
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(isLoading),
          ...genres
              .map((e) => MovieByGnera(gnera: e["name"], id: e["id"]))
              .toList(),
        ],
      ),
    );
  }

  Widget _buildBanner(bool isLoading) {
    final size = MediaQuery.of(context).size;
    return isLoading
        ? const BannerLoader()
        : Stack(
            children: [
              Container(
                  height: size.height * 0.5,
                  width: size.width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${movies[Random().nextInt(6)]["poster_path"]}"),
                      fit: BoxFit.fitWidth,
                    ),
                  )),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  height: 80,
                  width: size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black45,
                          Colors.black87,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.0,
                          0.15,
                          0.3,
                          0.45,
                        ]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButtons().iconButton(
                        icon: Icons.add,
                        onTap: () {},
                        label: "My List",
                      ),
                      CustomButtons().textButton(
                        label: 'Play',
                        onTap: () {},
                        icon: Icons.play_arrow,
                      ),
                      CustomButtons().iconButton(
                        icon: Icons.info_outline,
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container();
                              // const DetailBottomSheet(
                              //     // anime: animeProvider.bannerAnime!,
                              //     );
                            },
                          );
                        },
                        label: "Info",
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  @override
  bool get wantKeepAlive => true;
}
