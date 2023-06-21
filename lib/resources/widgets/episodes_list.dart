import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/episode_tile.dart';

class EpisodesList extends StatefulWidget {
  const EpisodesList({
    Key? key,
  }) : super(key: key);

  @override
  State<EpisodesList> createState() => _EpisodesListState();
}

class _EpisodesListState extends State<EpisodesList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        12,
        2,
        2,
        2,
      ]
          .map(
            (e) => const EpisodeTile(),
          )
          .toList(),
    );
  }
}
