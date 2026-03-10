import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews & Ratings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        const Text('4.8', style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900)),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Color(0xffec1313), size: 16),
                            Icon(Icons.star, color: Color(0xffec1313), size: 16),
                            Icon(Icons.star, color: Color(0xffec1313), size: 16),
                            Icon(Icons.star, color: Color(0xffec1313), size: 16),
                            Icon(Icons.star, color: Colors.grey, size: 16),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        children: [
                          _buildRatingBar(context, 5, 0.70),
                          _buildRatingBar(context, 4, 0.15),
                          _buildRatingBar(context, 3, 0.08),
                          _buildRatingBar(context, 2, 0.02),
                          _buildRatingBar(context, 1, 0.05),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Theme.of(context).scaffoldBackgroundColor, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffec1313),
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.edit_square),
                label: const Text('Write a Review', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context, int star, double percent) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 12, child: Text(star.toString(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: percent,
              backgroundColor: Theme.of(context).colorScheme.surface,
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffec1313)),
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
