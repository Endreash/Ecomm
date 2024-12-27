import 'package:flutter/material.dart';

class RatingAndReview extends StatelessWidget {
  const RatingAndReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              // color: Colors.grey,
              border:
                  Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              Text(
                '4.9',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
      // const SizedBox(width: 8),
      Container(
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
              // color: Colors.grey,
              border:
                  Border.all(color: const Color.fromARGB(255, 186, 185, 185)),
              borderRadius: const BorderRadius.all(Radius.circular(50))),
          child: const Row(
            children: [
              Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 18,
              ),
              Text(
                ' 94%',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )),
      // const SizedBox(width: 8),
      const Text(
        '117 reviews',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: Colors.grey),
      ),
      // const SizedBox(
      //   width: 8,
      // ),
      Container(
        height: 32,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.red[400]),
        child: const Center(
          child: Text(
            '% On sale',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
      )
    ]);
  }
}
