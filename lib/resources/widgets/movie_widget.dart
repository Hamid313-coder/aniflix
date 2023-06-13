import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/widgets/detail_bottom_sheet.dart';

class AnimeWidget extends StatelessWidget {
  // final Anime anime;

  const AnimeWidget({
    Key? key,
    // required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => showModalBottomSheet(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return DetailBottomSheet(
              // anime: anime,
              );
        },
      ),
      child: Container(
        margin: const EdgeInsets.all(4),
        width: size.width * 0.32,
        height: size.height * 0.22,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1675426513962-1db7e4c707c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
