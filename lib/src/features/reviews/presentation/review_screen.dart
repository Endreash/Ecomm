import 'package:ecomm/src/features/reviews/domain/review.dart';
import 'package:ecomm/src/features/reviews/presentation/review_rating_bar.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:ecomm/src/widgets/responsive_two_column_layout.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.itemId});
  final String itemId;
  
  @override
  Widget build(BuildContext context) {
    const review = null; // review == null new review, review != null edit review
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Leave a review'),
      ),
      body: 
      ResponsiveTwoColumnLayout(
        spacing: 16,
          breakpoint: 300,
          startFlex: 3,
          endFlex: 2,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.center,
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          startContent: Text('Purchased on '),
          endContent:LeaveReviewForm(itemId: itemId, review: review,),
        )
    );
  }
}

class LeaveReviewForm extends StatefulWidget {
  const LeaveReviewForm({super.key, required this.itemId, this.review});
  final String itemId;
  final Review? review;

  @override
  State<LeaveReviewForm> createState() => _LeaveReviewFormState();
}

class _LeaveReviewFormState extends State<LeaveReviewForm> {
  final _controller = TextEditingController();

  double _rating = 0;

  @override
  void initState() {
    super.initState();
    final review = widget.review;
    if (review != null) {
      _controller.text = review.comment;
      _rating = review.score;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submitReview() async {
    // await 
    // only submit if new rating or different from before
    // final previousReview = widget.review;
    // if (previousReview == null ||
    //     _rating != previousReview.score ||
    //     _controller.text != previousReview.comment) {
    //   // TODO: Submit review
    // }
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.review != null) ...[
            const Text(
              'You reviewed this product before. Submit again to edit.',
              textAlign: TextAlign.center,
            ),
          ],
          Center(
            child: ReviewRatingBar(
              initialRating: _rating,
              onRatingUpdate: (rating) => setState(() => _rating = rating),
            ),
          ),
          TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Your review (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: _rating == 0 ? null : _submitReview,
            child: const Text('Submit'),
          )
        ],
      ),
    );
  }
}
