import 'package:flutter/material.dart';

import '../../core/constants/dimensions.dart';
import '../../core/widgets/bottom_navbar/bottom_navbar.dart';

class SearchResultsPageView extends StatelessWidget {
  const SearchResultsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.horizontalPadding,
              vertical: Dimensions.verticalPadding,
            ),
          ),
          Column(
            children: [
              Center(child: Text('Search Results')),
            ],
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
