import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.cast), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffec1313), width: 2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Color(0xffec1313)),
                  hintText: 'Movies, shows, cast...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                const Icon(Icons.trending_up, color: Color(0xffec1313)),
                const SizedBox(width: 8),
                const Text('Trending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['Action', 'K-Drama', 'Thriller', 'New', 'Sci-Fi'].map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffec1313).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(tag, style: const TextStyle(color: Color(0xffec1313), fontSize: 12, fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            const Text('Popular Genres', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 16/9,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: ['Action', 'K-Drama', 'Comedy', 'Sci-Fi'].map((genre) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffec1313).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(genre, style: const TextStyle(color: Color(0xffec1313), fontWeight: FontWeight.bold)),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
