class Movie {
  final String title;
  final String imageUrl;
  final String link;
  final String? quality;
  final String? duration;
  final String? rating;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.link,
    this.quality,
    this.duration,
    this.rating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      link: json['link'] ?? '',
      quality: json['quality'],
      duration: json['duration'],
      rating: json['rating'],
    );
  }
}
