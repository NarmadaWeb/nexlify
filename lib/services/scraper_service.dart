import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../models/movie.dart';

class ScraperService {
  final String _baseUrl = 'https://v3.pusatfilm21info.com/';

  Future<List<Movie>> fetchMovies() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final document = parser.parse(response.body);
        final articles = document.querySelectorAll('article');

        List<Movie> movies = [];

        for (var article in articles) {
          final titleElement = article.querySelector('h2.entry-title a');
          final imgElement = article.querySelector('img');
          final ratingElement = article.querySelector('.gmr-rating-item');
          final durationElement = article.querySelector('.gmr-duration-item');
          final qualityElement = article.querySelector('.gmr-quality-item a');

          if (titleElement != null && imgElement != null) {
            final title = titleElement.text.trim();
            final link = titleElement.attributes['href'] ?? '';
            final imageUrl = imgElement.attributes['src'] ?? '';
            final rating = ratingElement?.text.trim();
            final duration = durationElement?.text.trim();
            final quality = qualityElement?.text.trim();

            movies.add(Movie(
              title: title,
              imageUrl: imageUrl,
              link: link,
              rating: rating,
              duration: duration,
              quality: quality,
            ));
          }
        }
        return movies;
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }

  Future<String?> fetchMovieIframeUrl(String link) async {
    try {
      if (link.isEmpty) return null;

      final response = await http.get(Uri.parse(link));

      if (response.statusCode == 200) {
        final document = parser.parse(response.body);
        final iframeElement = document.querySelector('.gmr-embed-responsive iframe');

        if (iframeElement != null) {
          return iframeElement.attributes['src'];
        }
      }
      return null;
    } catch (e) {
      print('Error fetching iframe URL: $e');
      return null;
    }
  }
}
