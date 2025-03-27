//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

// import 'package:json_annotation/json_annotation.dart';
// import 'package:movies_app/Domain/Models/movie.dart';
// // import '../../Domain/Entities/movie.dart';

// // part 'search_model.g.dart';

// @JsonSerializable()
// class SearchModel extends Movie {
//   @JsonKey(name: 'id')
//   final int id;

//   @JsonKey(name: 'title')
//   final String title;

//   @JsonKey(name: 'description_full')
//   final String? description;

//   @JsonKey(name: 'large_cover_image')
//   final String? largeCoverImage;

//   @JsonKey(name: 'rating')
//   final double? rating;

//   @JsonKey(name: 'genres')
//   final List<String>? genres;

//   SearchModel({
//     required this.id,
//     required this.title,
//     this.description,
//     this.largeCoverImage,
//     this.rating,
//     this.genres,
//   }) : super(
//           id: id,
//           title: title,
//           description: description,
//           largeCoverImage: largeCoverImage,
//           rating: rating,
//           genres: genres,
//         );

//   factory SearchModel.fromJson(Map<String, dynamic> json) =>
//       _$SearchModelFromJson(json);

//   Map<String, dynamic> toJson() => _$SearchModelToJson(this);
// }
