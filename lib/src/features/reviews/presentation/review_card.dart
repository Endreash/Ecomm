import 'package:ecomm/src/features/reviews/domain/review.dart';
import 'package:ecomm/src/features/reviews/presentation/review_rating_bar.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(this.review, {super.key});
  final Review review;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReviewRatingBar(
                  initialRating: review.score,
                  ignoreGestures: true,
                  itemSize: 20,
                  onRatingUpdate:(value) => showDialog(context: context, builder: (context) => const AlertDialog(title: Text('Wats UP!')),)
                  ),
                  if (review.comment.isNotEmpty) ...[
                Text(
                  review.comment
                )
            ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}