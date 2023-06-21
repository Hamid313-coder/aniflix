import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/detail_bottom_sheet.dart';
import 'package:flutter_anime_flix/resources/widgets/progress_indicator.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    Future.delayed(
        const Duration(seconds: 5), () => setState(() => isLoading = false));
  }

  @override
  Widget build(BuildContext context) {
    // final wishlistProvider = Provider.of<WishListProvider>(context);
    final mediaquery = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: 8,
              top: mediaquery.padding.top + kToolbarHeight,
            ),
            child: const Text("Wishlist", style: TextStyles.primaryTitle),
          ),
          Expanded(
            child: isLoading
                ? const CustomProgressIndicator()
                : GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      // final anime = wishlistProvider.wishlist[index];
                      return GestureDetector(
                        onTap: () => showBottomSheet(
                          context: context,
                          builder: (context) => const SavedBottomSheet(
                              // id: anime.id,
                              // title: anime.title,
                              // image: anime.imageUrl
                              ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          width: mediaquery.size.width * 0.32,
                          height: mediaquery.size.height * 0.22,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1675426513962-1db7e4c707c3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
