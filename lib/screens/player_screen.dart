import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/movie.dart';
import '../services/scraper_service.dart';

class PlayerScreen extends StatefulWidget {
  final Movie movie;
  const PlayerScreen({super.key, required this.movie});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late Future<String?> _iframeUrlFuture;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black);

    if (widget.movie.iframeUrl != null && widget.movie.iframeUrl!.isNotEmpty) {
      _iframeUrlFuture = Future.value(widget.movie.iframeUrl);
      _loadUrl(widget.movie.iframeUrl!);
    } else {
      _iframeUrlFuture = ScraperService().fetchMovieIframeUrl(widget.movie.link);
      _iframeUrlFuture.then((url) {
        if (url != null) {
          _loadUrl(url);
        }
      });
    }
  }

  void _loadUrl(String url) {
    final uri = Uri.tryParse(url);
    if (uri != null) {
      _controller.loadRequest(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(widget.movie.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
            if (widget.movie.quality != null)
              Text(widget.movie.quality!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<String?>(
        future: _iframeUrlFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.movie.imageUrl,
                    fit: BoxFit.cover,
                    color: Colors.black54,
                    colorBlendMode: BlendMode.darken,
                  ),
                  const Center(
                    child: CircularProgressIndicator(color: Color(0xffec1313)),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.movie.imageUrl,
                  fit: BoxFit.cover,
                  color: Colors.black54,
                  colorBlendMode: BlendMode.darken,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.white, size: 60),
                      const SizedBox(height: 16),
                      const Text(
                        'Video source not found or unavailable.',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                             _iframeUrlFuture = ScraperService().fetchMovieIframeUrl(widget.movie.link);
                             _iframeUrlFuture.then((url) {
                               if (url != null) {
                                 _loadUrl(url);
                               }
                             });
                          });
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xffec1313)),
                        child: const Text('Retry', style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ],
            );
          }

          return SafeArea(
            child: WebViewWidget(controller: _controller),
          );
        },
      ),
    );
  }
}
