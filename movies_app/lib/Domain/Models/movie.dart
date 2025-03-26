class Movie {
  final int id;
  final String title;
  final String? description;
  final String? largeCoverImage;
  final double? rating;
  final List<String>? genres;

  Movie({
    required this.id,
    required this.title,
    this.description,
    this.largeCoverImage,
    this.rating,
    this.genres,
  });
}
