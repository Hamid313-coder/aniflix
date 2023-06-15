import 'package:flutter/material.dart';
import 'package:flutter_anime_flix/resources/constants/constants.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final searchProvider = Provider.of<SearchProvider>(context);
    return BottomSheet(
      backgroundColor: Colors.grey.shade900,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Filters",
                  style: TextStyles.primaryTitle,
                ),
              ),
              const Text(
                "Format",
                style: TextStyles.secondaryTitle2,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  children: List.generate(
                      6,
                      (index) => GestureDetector(
                            onTap: () => {},
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "format",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: (true ? Colors.red : Colors.white),
                                  ),
                                )),
                          )),
                ),
              ),
              const Text(
                "Season Period",
                style: TextStyles.secondaryTitle2,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  children: List.generate(
                      6,
                      (index) => GestureDetector(
                            onTap: () => {},
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text(
                                  "period",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: true ? Colors.red : Colors.white),
                                )),
                          )),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                      backgroundColor: Colors.red),
                  child: const Text(
                    "Apply",
                    style: TextStyles.secondaryTitle2,
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
}

showFilterBottomSheet(BuildContext context) {
  showBottomSheet(
      context: context,
      builder: (context) {
        // final searchProvider = Provider.of<SearchProvider>(context);
        return BottomSheet(
            backgroundColor: Colors.grey.shade900,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          const Text(
                            "Filters",
                            style: TextStyles.primaryTitle,
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close))
                        ],
                      ),
                    ),
                    const Text(
                      "Format",
                      style: TextStyles.secondaryTitle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        children: List.generate(
                            6,
                            (index) => GestureDetector(
                                  onTap: () => {},
                                  // searchProvider.setFormatFilter(index),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        "format",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: (true
                                                ? Colors.red
                                                : Colors.white)),
                                      )),
                                )),
                      ),
                    ),
                    const Text(
                      "Season Period",
                      style: TextStyles.secondaryTitle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        children: List.generate(
                            6,
                            (index) => GestureDetector(
                                  onTap: () => {},
                                  // searchProvider.setPeriodFilter(index),
                                  child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        "period",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: false
                                                ? Colors.red
                                                : Colors.white),
                                      )),
                                )),
                      ),
                    ),
                  ],
                ),
              );
            },
            enableDrag: true,
            onClosing: () {});
      });
}
