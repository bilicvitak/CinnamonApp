import 'package:flutter/material.dart';

import 'rating_bar_star.dart';

class RatingBar extends StatelessWidget {
  final int maxRating;

  const RatingBar({required this.maxRating});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      for(var index = 1; index <= maxRating; index++)
          RatingBarStar(index: index)
    ],
  );
}
