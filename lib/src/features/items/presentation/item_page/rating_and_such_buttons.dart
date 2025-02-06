// import 'package:ecomm/src/features/reviews/domain/review.dart';
import 'package:ecomm/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RatingAndReview extends StatelessWidget {
  const RatingAndReview({required this.itemId, super.key});
  // final Review review;
  final String itemId;

//TODO: get the rating and review dynamically
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              // color: Colors.grey,
              border: Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              Text(
                // review.score
                '4.9',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
      const SizedBox(width: 8),
      Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              // color: Colors.grey,
              border: Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 16,
              ),
              Text(
                // review.score make in percent i guess
                ' 94%',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
      const SizedBox(width: 4),
      TextButton(
        onPressed: () => context.goNamed(
          AppRoute.leaveReview.name,
          // pathParameters: {'id':item.id},
          pathParameters: {'id':itemId},
        ),
        child : const Text(
          '117 reviews',
          style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),),
        
      ),
    ]);
  }
}
