import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';

class PlayerScreen extends StatefulWidget {
  final Movie movie;
  const PlayerScreen({super.key, required this.movie});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: widget.movie.imageUrl,
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Column(
                  children: [
                    Text(widget.movie.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const Text('S1 E1', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10, color: Colors.white, size: 40),
                  onPressed: () {},
                ),
                const SizedBox(width: 32),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xffec1313),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black54, blurRadius: 10, offset: const Offset(0, 5)),
                    ],
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white, size: 48),
                ),
                const SizedBox(width: 32),
                IconButton(
                  icon: const Icon(Icons.forward_10, color: Colors.white, size: 40),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 32,
            left: 32,
            right: 32,
            child: Column(
              children: [
                LinearProgressIndicator(
                  value: 0.35,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffec1313)),
                  minHeight: 4,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('22:15', style: TextStyle(color: Colors.white, fontSize: 12)),
                    Text(widget.movie.duration ?? '54:00', style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.volume_up, color: Colors.white),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffec1313),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Next Episode', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
