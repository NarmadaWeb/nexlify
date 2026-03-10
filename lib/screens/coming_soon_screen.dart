import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  final List<Map<String, String>> items = const [
    {
      "title": "Sweet Home",
      "date": "Dec 15",
      "desc": "As humans turn into monsters, survivors fight for humanity.",
      "img": "https://lh3.googleusercontent.com/aida-public/AB6AXuA1qyBzlyC39z2W7zRp8htnZ00RbrEEJKhEJTvM_6Vtn30iuh1nX433L58LMRTGhxasvay7uHocEqI3QHRpfLgEEGmDngx2yZSPiM3f2Q3lpgLkZnQJhIsTtcLgkgrRhzMYnNNt4wPyeRFnKxAdKnTq4AqTOx9uTOBjaZ6eRzNEfbGB8moUJy7yhcr3xJRAGINlP5391rZFmYMe7hpJJ3MGKZgUFi0RB0avFKhD0vK8U-kQes5vM4QOXkpSeOrKZDsKzLiwF91jIl6M"
    },
    {
      "title": "Hidden Love",
      "date": "Dec 20",
      "desc": "A heartwarming youth romance that spans years.",
      "img": "https://lh3.googleusercontent.com/aida-public/AB6AXuAw_-TnjJlsuhrddTBWxoNin5jy0GeBGm8GQBI-OxP-XF6yZul51UUVezXbWBBEzhYZiuetrHVWBgOQC7SbcQ6vaZRCjGbxYFOs2s2drA-K9nKNuiONDtRPpMm_kavcF70Fp343BHYQWYI7jDtsNxJsDU0tAM0IrNGHqTAxKYM8b_fhsQDC2W5hVtzHy10pFxCWeoW9E4t3bdTrbh1agaA1fJ6_jvKlN2h-gANjAl-a68p3trmP7UVly9s0-3QuxNLjQ1lh2vm9vHYY"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Soon', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: item['img']!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red[900]?.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(item['date']!, style: const TextStyle(color: Color(0xffec1313), fontSize: 10, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(width: 8),
                    const Text('Friday', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(item['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(item['desc']!, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffec1313),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.notifications_active, size: 18),
                  label: const Text('Remind Me', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
