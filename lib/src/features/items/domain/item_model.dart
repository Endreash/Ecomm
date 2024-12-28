typedef ItemID = String;

// Class representing an item.
class Item {
  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.description,
    required this.availableQuantity,
    // this.avgRating = 0,
    // this.numRatings = 0,
  });
  final ItemID id;
  final String name;
  final String price; // turn to double
  final String rating;
  final String imagePath;
  final String description;
  final int availableQuantity;
  // final double avgRating;
  // final int numRatings;
}