import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/anime_widget.dart';
import 'package:flutter_anime_flix/resources/widgets/shimmer.dart';
import 'package:provider/provider.dart';

class AnimesByGenra extends StatefulWidget {
  final String gnera;
  final int id;
  const AnimesByGenra({
    Key? key,
    required this.gnera,
    required this.id,
  }) : super(key: key);

  @override
  _AnimesByGenraState createState() => _AnimesByGenraState();
}

class _AnimesByGenraState extends State<AnimesByGenra>
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
    final size = MediaQuery.of(context).size;
    // final animesProvider = Provider.of<AnimeProvider>(context);
    // final gnerasAnime = animesProvider.getAnimeByGnera(widget.id);
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
                itemCount: isLoading ? 5 : 7,
                itemBuilder: (context, index) {
                  return isLoading
                      ? LoaderWidget.rectangular(
                          height: size.height * 0.22,
                          width: size.width * 0.32,
                        )
                      : AnimeWidget(
                          // anime: gnerasAnime[index],
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