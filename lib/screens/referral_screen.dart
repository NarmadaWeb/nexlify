import 'package:flutter/material.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral Program', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 192,
              height: 192,
              decoration: BoxDecoration(
                color: const Color(0xffec1313).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.redeem, size: 96, color: Color(0xffec1313)),
            ),
            const SizedBox(height: 32),
            const Text('Invite a friend', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 16),
                children: [
                  const TextSpan(text: 'Get '),
                  const TextSpan(text: '1 month free Premium', style: TextStyle(color: Color(0xffec1313), fontWeight: FontWeight.bold)),
                  const TextSpan(text: ' for every friend who signs up!'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xffec1313).withOpacity(0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xffec1313).withOpacity(0.3), width: 2),
              ),
              child: Column(
                children: [
                  const Text('YOUR REFERRAL CODE', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  const Text('NEX-2024', style: TextStyle(color: Color(0xffec1313), fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 4)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xffec1313),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    icon: const Icon(Icons.copy, size: 16),
                    label: const Text('Tap to Copy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),
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
          icon: const Icon(Icons.ios_share),
          label: const Text('Share Link', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}
