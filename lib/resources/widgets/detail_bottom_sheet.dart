import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/button.dart';

class DetailBottomSheet extends StatelessWidget {
  // final Anime anime;

  const DetailBottomSheet({
    Key? key,
    // required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final wishlistProvider = Provider.of<WishListProvider>(context);
    return BottomSheet(
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(size),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(maxWidth: size.width * 0.4),
                              child: const Text(
                                "title",
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.primaryTitle,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'Movie',
                              style: TextStyles.secondaryTitle,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              'test Text',
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomButtons().iconButton(
                      icon: Icons.close,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtons().iconButton(
                    icon: Icons.play_circle,
                    onTap: () {},
                    label: 'Play',
                  ),
                  CustomButtons().iconButton(
                    icon: Icons.download_for_offline,
                    onTap: () {},
                    label: 'Download',
                  ),
                  CustomButtons().iconButton(
                    icon: Icons.add_circle_sharp,
                    onTap: () {},
                    label: 'My List',
                  ),
                  CustomButtons().iconButton(
                    icon: Icons.share_sharp,
                    onTap: () {},
                    label: 'Share',
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Divider(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/detailscreen',
                    arguments: json.encode(
                      {
                        // 'id': anime.malId,
                        'type': 0,
                      },
                    ),
                  );
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(Icons.info_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Episodes & Info'),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_sharp)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }

  Widget _buildImage(size) {
    return Container(
      margin: const EdgeInsets.all(8),
      constraints: BoxConstraints(
        maxWidth: size.width * 0.24,
        maxHeight: 120,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1675426513962-1db7e4c707c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SavedBottomSheet extends StatelessWidget {
  // final int id;
  // final String title;
  // final String image;
  const SavedBottomSheet(
      // {Key? key, required this.id, required this.title, required this.image}
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final wishlistProvider = Provider.of<WishListProvider>(context);
    return BottomSheet(
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    )),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    width: 150,
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1675426513962-1db7e4c707c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: size.width * 0.5),
                      child: const Text(
                        "headline 6",
                        style: TextStyles.primaryTitle,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: const EdgeInsets.all(8),
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.red))),
                      onPressed: () {
                        // wishlistProvider.removeFromList(id).then((value) {
                        //   showCustomSnackBar(context, "Removed!!");
                        //   Navigator.pop(context);
                        // }).catchError((err) =>
                        //     showCustomSnackBar(context, err.toString()));
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                      label: const Text("Remove"),
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.all(8),
                              backgroundColor: Colors.red,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.red))),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/detailscreen',
                                arguments: json.encode({
                                  'id': 21,
                                  'type': 3,
                                }));
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text("Watch Now")),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
      onClosing: () {},
    );
  }
}
