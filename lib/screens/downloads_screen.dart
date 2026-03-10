import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  final List<Map<String, String>> downloads = const [
    {
      "title": "Inception",
      "size": "2.4 GB",
      "time": "2:28:00",
      "img": "https://lh3.googleusercontent.com/aida-public/AB6AXuBe8dEZf_iqernxgxVuw3YvOyDBsT5xkmCrTKQT5fIMmQRG77kB01Jr6En0DDaY9XtNXmwzncWnzp7SknQrVLFBBbjC6JJyTwzRBHwavkpm8EiDFhx-pwWdWd5aZDg5_pZ31I5B0SaTmVSJlDAelfiEHg6M12MABUKkYmc0PJlI2GT5wyZXnLjt4ww2-kTKRsZw6B1wkZVTa3_5sZ1t6Nu1rip4FoMZlo5SlaENJjUkZhcwbid-mQH5LDIM-GzoTIme5uSkP2VghqK8"
    },
    {
      "title": "Blade Runner",
      "size": "3.1 GB",
      "time": "1:54:00",
      "img": "https://lh3.googleusercontent.com/aida-public/AB6AXuCXYCKLFKvpknH48RTpulcuNUFlkGhVePWh6HQ4z1MySY_cP27fYp74Ne6Q_3dWie9JcIEkoFoP7Y6T5kTc3QAQVh0lrYZq3ikd8EASL6175s3QrLCYVDxkhF58588KLyKliS0gP2G6gQ4RZshleOc3btoYbxhnZGnhKgk1GTylreZbpYf-fUu-SE6VToo-0MPpI_T7XqVmckZzKi6UdOn539B3Mea8QW3r1RRHLXOP6k7tuHVf6FpgNGwRjeSuIGdXNgwrNRwefF75"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Downloads', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Edit', style: TextStyle(color: Color(0xffec1313), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Storage Used', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Text('75%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.75,
                    backgroundColor: Colors.red[900]?.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xffec1313)),
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: downloads.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = downloads[index];
                return Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: item['img']!,
                            height: 60,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(item['time']!, style: const TextStyle(color: Colors.white, fontSize: 10)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text('${item['size']} • Downloaded', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_circle_fill, color: Color(0xffec1313), size: 36),
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
