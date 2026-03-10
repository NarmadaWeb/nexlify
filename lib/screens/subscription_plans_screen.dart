import 'package:flutter/material.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Unlock Unlimited Nexlify',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text('Choose the perfect plan for you. Cancel anytime.', style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 32),
            _buildPlanCard(context, 'Basic', '\$8.99', ['SD Quality', 'Watch on 1 Screen'], false),
            const SizedBox(height: 16),
            _buildPlanCard(context, 'Standard', '\$12.99', ['HD Quality', 'Watch on 2 Screens', 'Limited Downloads'], false),
            const SizedBox(height: 16),
            _buildPlanCard(context, 'Premium', '\$17.99', ['4K Ultra HD', 'Watch on 4 Screens', 'Unlimited Downloads'], true),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, String name, String price, List<String> features, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xffec1313) : Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isActive ? const Color(0xffec1313) : Colors.white10),
        boxShadow: isActive ? [BoxShadow(color: const Color(0xffec1313).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))] : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: TextStyle(color: isActive ? Colors.white : Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: price, style: TextStyle(color: isActive ? Colors.white : Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    TextSpan(text: '/mo', style: TextStyle(color: isActive ? Colors.white70 : Colors.grey, fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ...features.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: isActive ? Colors.white : Colors.grey, size: 18),
                const SizedBox(width: 8),
                Text(f, style: TextStyle(color: isActive ? Colors.white : Colors.white70, fontSize: 14)),
              ],
            ),
          )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
                foregroundColor: isActive ? const Color(0xffec1313) : Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(isActive ? 'Selected' : 'Select $name', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
