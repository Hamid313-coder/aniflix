import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/repositories/movies.dart';
import 'package:flutter_anime_flix/resources/constants/config.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/button.dart';
import 'package:flutter_anime_flix/resources/widgets/recommendations_widget.dart';
import 'package:flutter_anime_flix/screens/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetail extends StatefulWidget {
  final Map<String, dynamic> movie;
  final List<Map<String, dynamic>> recommendedMovies;
  const MovieDetail(
      {Key? key, required this.movie, required this.recommendedMovies})
      : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> with RouteAware {
  late YoutubePlayerController controller;
  final bool _showEpisodes = true;
  bool _fulldesc = false;
  bool isLoading = true;
  final moviesRepo = MovieRepositories();

  @override
  void initState() {
    super.initState();

    moviesRepo.getMovieTeaserById(widget.movie["id"]).then((value) {
      controller = YoutubePlayerController(
        initialVideoId: value,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          isLive: false,
          controlsVisibleAtStart: false,
          loop: false,
          forceHD: false,
        ),
      );

      setState(() => isLoading = false);
    });
  }

  @override
  void didChangeDependencies() {
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    resetStatusbar();
    controller.play();
    super.didPopNext();
  }

  @override
  void didPushNext() {
    hideStatusBar();
    controller.pause();
    super.didPushNext();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : ListView(
              children: [
                _buildTrailerPlayer(),
                _buildTitle(),
                _buildInfo(),
                _buildButtons(),
                _buildDetails(),
                _buildActionBar(),
                _buildSection(),
              ],
            ),
    );
  }

  Widget _buildTrailerPlayer() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: false,
          liveUIColor: Colors.red,
        ),
        Positioned.fill(
            child: GestureDetector(
          onTap: () => setState(
            () {
              (controller.value.isPlaying)
                  ? controller.pause()
                  : controller.play();
            },
          ),
        )),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        widget.movie["title"],
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      child: Row(
        children: [
          Text(
            widget.movie["release_date"],
            style: TextStyles.secondaryTitle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(widget.movie["vote_average"].toString()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        CustomButtons().textButton(
          label: 'Play',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => VideoScreen(title: widget.movie["title"])));
          },
          icon: Icons.play_arrow,
        ),
        CustomButtons().textButton(
          label: 'Download',
          onTap: () {},
          icon: Icons.download_sharp,
          revert: true,
        ),
      ],
    );
  }

  Widget _buildDetails() {
    return StatefulBuilder(builder: (context, ss) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.movie["overview"],
              maxLines: _fulldesc ? null : 3,
            ),
            GestureDetector(
              onTap: () {
                ss(() {
                  _fulldesc = !_fulldesc;
                });
              },
              child: Text(
                _fulldesc ? '...less' : '...more',
                style: const TextStyle(color: Colors.grey),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _buildActionBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButtons().iconButton(
            icon: Icons.add,
            onTap: () {},
            label: 'My List',
          ),
          CustomButtons().iconButton(
            icon: Icons.thumb_up_outlined,
            onTap: () {},
            label: 'Rate',
          ),
          CustomButtons().iconButton(
            icon: Icons.share,
            onTap: () {},
            label: 'Share',
          ),
          CustomButtons().iconButton(
            icon: Icons.download_sharp,
            onTap: () {},
            label: 'Download',
          ),
        ],
      ),
    );
  }

  Widget _buildSection() {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 8,
          ),
          width: size.width,
          height: 1,
          color: Colors.grey,
        ),
        Row(
          children: [
            _buildSectionButton(
              'MORE LIKE THIS',
              !_showEpisodes,
            )
          ],
        ),
        RecommendedMovies(
          recommendedMovies: widget.recommendedMovies,
        )
      ],
    );
  }

  Widget _buildSectionButton(
    String title,
    bool value,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.red.shade800, width: 4)),
      ),
      child: Text(title),
    );
  }
}
