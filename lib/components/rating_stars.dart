import 'package:flutter/material.dart';
import 'package:ozb_cli/utils/constants.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildStarRating(rating),
      ],
    );
  }
}

Row buildStarRating(double rating) {
  int filledStars = rating.toInt();
  List<Widget> starIcons = [];

  for (int i = 0; i < filledStars; i++) {
    starIcons.add(const Icon(Icons.star, color: AppColors.starColor));
  }

  for (int i = filledStars; i < 5; i++) {
    starIcons.add(const Icon(Icons.star_border, color: AppColors.starColor));
  }

  return Row(children: starIcons);
}
