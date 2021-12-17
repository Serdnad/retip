import 'dart:math';

class Review {
  int stars;
  String? comment;
  DateTime date;

  Review({required this.stars, this.comment, required this.date});

  // FOR TESTING
  static var r = Random();
  static Review random() {
    final comments = [
      "Food was great and the service even better, definitely recommend this place.",
      "Nice ambience, but my pasta was a little on the dry side.",
      "It was okay, nothing to write home about.",
      "Great cocktails, and the staff had some really great recommendations!"
    ];

    return Review(
      stars: r.nextInt(5) + 1,
      comment: comments[r.nextInt(comments.length)],
      date: DateTime.now().subtract(Duration(days: r.nextInt(60))),
    );
  }
}
