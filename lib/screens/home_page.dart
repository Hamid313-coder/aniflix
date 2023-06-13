import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/button.dart';
import 'package:flutter_anime_flix/resources/widgets/detail_bottom_sheet.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_by_gnera.dart';
import 'package:flutter_anime_flix/resources/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    Future.delayed(
        Duration(seconds: 5), () => setState(() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: ListView(
        children: [
          _buildBanner(isLoading),
          const MovieByGnera(
            gnera: "Action",
            id: 1,
          ),
          const MovieByGnera(
            gnera: "Adventure",
            id: 2,
          ),
          const MovieByGnera(
            gnera: "Romance",
            id: 22,
          ),
          const MovieByGnera(
            gnera: "Sci-Fi",
            id: 22,
          ),
          const MovieByGnera(
            gnera: "Comedy",
            id: 4,
          ),
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
                        "https://images.unsplash.com/photo-1675426513962-1db7e4c707c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                      ),
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
                              return DetailBottomSheet(
                                  // anime: animeProvider.bannerAnime!,
                                  );
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
