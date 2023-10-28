import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  final Function? callback;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      required this.onRatingChanged,
      required this.color,
      this.callback,
      required double size});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        // color: Theme.of(context).buttonColor,
        size: 16,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: 16,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: 16,
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null
          ? null
          : () {
              onRatingChanged(index + 1.0);
              callback!(index + 1.0);
            },
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
