import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:flutter_anime_flix/resources/widgets/filter_bottom_sheet.dart';
import 'package:flutter_anime_flix/screens/all_movie_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildtextField(),
          _buildTitleBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: genres
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => AllMovieScreen(gnere: e)));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              e["name"],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildtextField() {
    final mediaquery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
        top: mediaquery.padding.top + kToolbarHeight,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: TextFormField(
          controller: _searchController,
          obscureText: false,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: const Icon(Icons.clear)),
            hintText: "Search",
            border: InputBorder.none,
            labelStyle: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          onFieldSubmitted: (_) => Navigator.pushNamed(
            context,
            '/allanimescreen',
            arguments: json.encode(
              {'query': _searchController.text, 'gnera': ""},
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Row(
        children: [
          const Text(
            "Genras",
            style: TextStyles.primaryTitle,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showFilterBottomSheet(context);
            },
            icon: const Icon(
              Icons.filter_list_rounded,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
