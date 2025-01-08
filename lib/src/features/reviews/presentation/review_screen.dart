import 'package:ecomm/src/features/reviews/domain/review.dart';
import 'package:ecomm/src/features/reviews/presentation/review_rating_bar.dart';
import 'package:ecomm/src/widgets/responsive_center.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key, required this.itemId});
  final String itemId;
  
  @override
  Widget build(BuildContext context) {
    const review = null; // review == null new review, review != null edit review
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text('Leave a review'),
      ),
      body: ResponsiveCenter(child: LeaveReviewForm(itemId: itemId, review: review,)),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          const SizedBox(height: 8,),
          TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Your review (optional)',
              // border: OutlineInputBorder(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 16.0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.0),)
            ),
          ),
          const SizedBox(height: 16,),
          // ElevatedButton(
          //   onPressed: _rating == 0 ? null : _submitReview,
          //   child: const Text('Submit'),
          // )
          GestureDetector(
          onTap: () => {
            // ref.read(cartProvider.notifier).add(item),
            // print('Ehe! Right there.')
            _rating == 0 ? null : _submitReview
          },
          child: Container(
            height: 64,
            width: 192,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24), color: const Color.fromRGBO(91, 192, 109, 5)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        )
        ],
      ),
    );
  }
}
