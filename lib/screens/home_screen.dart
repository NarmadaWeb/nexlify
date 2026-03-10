import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/movie.dart';
import '../services/scraper_service.dart';
import 'details_screen.dart';
import 'notification_screen.dart';
import 'series_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();
    _moviesFuture = ScraperService().fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff1a0505),
              ),
              child: Row(
                children: [
                  Icon(Icons.play_circle_fill, color: const Color(0xffec1313), size: 40),
                  const SizedBox(width: 8),
                  const Text('Nexlify', style: TextStyle(color: Color(0xffec1313), fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.movie, color: Colors.grey[400]),
              title: const Text('Movies', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv, color: Colors.grey[400]),
              title: const Text('Series', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SeriesScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[400]),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
            elevation: 0,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.play_circle_fill, color: Color(0xffec1313), size: 28),
                SizedBox(width: 8),
                Text('Nexlify', style: TextStyle(color: Color(0xffec1313), fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen()));
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildFeaturedContent(context),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(height: 24),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Latest Releases', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () {},
                    child: const Text('View All', style: TextStyle(color: Color(0xffec1313), fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(color: Color(0xffec1313)),
                  ));
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading data.', style: TextStyle(color: Colors.grey[400])));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No movies found.', style: TextStyle(color: Colors.grey[400])));
                }

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final movie = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(movie: movie)));
                        },
                        child: Container(
                          width: 130,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CachedNetworkImage(
                                imageUrl: movie.imageUrl,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(color: Colors.grey[800]),
                                errorWidget: (context, url, error) => Container(color: Colors.grey[800], child: const Icon(Icons.error)),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  child: Text(
                                    movie.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              if (movie.quality != null)
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffec1313),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      movie.quality!,
                                      style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 100), // padding for bottom nav
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to feature details
      },
      child: Container(
        height: 400,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const CachedNetworkImageProvider('https://lh3.googleusercontent.com/aida-public/AB6AXuB-Qp5j6DAwto482Ru0RAsRO8F6d1dDB9fqGnJR7rbxd08BlWsLobukV2zkWsBK0YtNuuEBEHG2BXyWVDMm8hFMgoeme00yiNgo0SSykuopibEd3GnyoHCsceHjY2TMxt0lUvS9rblE9-4Ago95eOgZ5f_aUsc2HiFUsUTcj8Posq-hdFHtnjwZnsREIgLvAW_4ZZKPIkuKbXqxWtEtZYPozRfsF6c8JzHfF0tJ57UptXXbyHrHECNGvtWJxvv2p__uFtgMvawEdHgs'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Theme.of(context).scaffoldBackgroundColor, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xffec1313),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('#1 in Korea', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Squid Game',
                    style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, height: 1.1),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Hundreds of players accept a strange invitation to compete in children's games for a tempting prize.",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffec1313),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    icon: const Icon(Icons.play_arrow_rounded, size: 24),
                    label: const Text('Watch Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
