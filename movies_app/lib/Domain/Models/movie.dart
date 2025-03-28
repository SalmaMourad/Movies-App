class Movie {
  final int id;
  final String title;
  final String? description;
  final String? largeCoverImage;
  final String? mediumCoverImage;  // Add this
  final String? smallCoverImage;   // Add this
  final double? rating;
  final List<String>? genres;

  Movie({
    required this.id,
    required this.title,
    this.description,
    this.largeCoverImage,
    this.mediumCoverImage,  // Add this
    this.smallCoverImage,   // Add this
    this.rating,
    this.genres,
  });
}
