import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'subscription_plans_screen.dart';
import 'referral_screen.dart';
import 'support_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Color(0xffec1313)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffec1313), width: 4),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: CachedNetworkImageProvider(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuD7Mmkxui525MrTrA5ebqnLlmEoxpJSe-YBIZH8BOBIu4O-qvOyefOOoqhO4iNtfttALSR5D2WnEmBE3FoqUUAg0CZHf5qZFA0fc2CoUMwA5k7JCVPI1ohkRnjY3uLKVIPuZenO4aM_Q9iK4xXfCRR_eCb-PMaS69UEzYT2drfVmsctbNZ6uOvxKmC-btfuiFLVPyoSusPq6VFlRp2HHxSZFKM1Z732K6NphM4fd1xLEpKUwmUkJMXk9tNYrYTYsiM-Frn1ul2at0CD'
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xffec1313),
                            shape: BoxShape.circle,
                            border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                          ),
                          child: const Icon(Icons.edit, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Ji-eun Park', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('jieun.park@nexlify.com', style: TextStyle(color: Colors.grey, fontSize: 14)),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xffec1313).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('VIP MEMBER', style: TextStyle(color: Color(0xffec1313), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                _buildStatCard(context, '24', 'My List'),
                const SizedBox(width: 12),
                _buildStatCard(context, '12', 'Downloads'),
                const SizedBox(width: 12),
                _buildStatCard(context, '48h', 'Watched'),
              ],
            ),
            const SizedBox(height: 32),
            _buildActionItem(
              context,
              icon: Icons.diamond,
              title: 'Subscription Plan',
              subtitle: 'Nexlify Premium',
              iconColor: const Color(0xffec1313),
              bgColor: const Color(0xffec1313).withOpacity(0.1),
              borderColor: const Color(0xffec1313).withOpacity(0.2),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SubscriptionPlansScreen())),
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              context,
              icon: Icons.history,
              title: 'Watch History',
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              context,
              icon: Icons.redeem,
              title: 'Referral Program',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ReferralScreen())),
            ),
            const SizedBox(height: 12),
            _buildActionItem(
              context,
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SupportScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    Color? iconColor,
    Color? bgColor,
    Color? borderColor,
    VoidCallback? onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? Colors.white10),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor ?? Colors.grey),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: iconColor ?? Colors.grey, fontSize: 12, fontWeight: FontWeight.w500)) : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap ?? () {},
      ),
    );
  }
}
