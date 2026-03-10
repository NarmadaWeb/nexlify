class Movie {
  final String title;
  final String imageUrl;
  final String link;
  final String? quality;
  final String? duration;
  final String? rating;
  final String? iframeUrl;

  Movie({
    required this.title,
    required this.imageUrl,
    required this.link,
    this.quality,
    this.duration,
    this.rating,
    this.iframeUrl,
  });

  Movie copyWith({
    String? title,
    String? imageUrl,
    String? link,
    String? quality,
    String? duration,
    String? rating,
    String? iframeUrl,
  }) {
    return Movie(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      link: link ?? this.link,
      quality: quality ?? this.quality,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      iframeUrl: iframeUrl ?? this.iframeUrl,
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      link: json['link'] ?? '',
      quality: json['quality'],
      duration: json['duration'],
      rating: json['rating'],
      iframeUrl: json['iframeUrl'],
    );
  }
}
