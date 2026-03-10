import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How can we help?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Color(0xffec1313)),
                  hintText: 'Search FAQs...',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildHelpItem(context, 'Reset Password'),
                const SizedBox(width: 12),
                _buildHelpItem(context, 'Fix Buffering'),
              ],
            ),
            const SizedBox(height: 24),
            _buildListItem(context, 'Billing & Subscription'),
            _buildListItem(context, 'Account Settings'),
            _buildListItem(context, 'Device Management'),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton.icon(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffec1313),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(56),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          icon: const Icon(Icons.chat),
          label: const Text('Start Live Chat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }

  Widget _buildHelpItem(BuildContext context, String title) {
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
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffec1313).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.help_outline, color: Color(0xffec1313)),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
