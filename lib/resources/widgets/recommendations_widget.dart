import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/movie_widget.dart';

class RecommendedAnimes extends StatefulWidget {
  final int animeId;

  const RecommendedAnimes({
    Key? key,
    required this.animeId,
  }) : super(key: key);

  @override
  State<RecommendedAnimes> createState() => _RecommendedAnimesState();
}

class _RecommendedAnimesState extends State<RecommendedAnimes> {
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
        return const MovieWidget(
            // anime: ap.recommended[index],
            );
      },
      itemCount: 7,
    );
  }
}
