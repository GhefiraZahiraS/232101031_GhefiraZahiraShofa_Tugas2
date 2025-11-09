import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Greeting =====
            const Text(
              'Welcome Back,',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              'Ghefira Zahira Shofa',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // ===== My Cards =====
            const Text(
              'My Cards',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ===== Slideable ATM Cards =====
            SizedBox(
              height: 150, // diperkecil sedikit
              child: PageView(
                controller: PageController(viewportFraction: 0.8),
                children: const [
                  AtmCard(
                    bankName: 'BRI',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF8E2DE2),
                    color2: Color(0xFF4A00E0),
                  ),
                  AtmCard(
                    bankName: 'BCA',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFFFF6A00),
                    color2: Color(0xFFFFB347),
                  ),
                  AtmCard(
                    bankName: 'Mandiri',
                    cardNumber: '**** 1355',
                    balance: 'Rp10.000.000',
                    color1: Color(0xFF36D1DC),
                    color2: Color(0xFF5B86E5),
                  ),
                  AtmCard(
                    bankName: 'BTN',
                    cardNumber: '**** 4045',
                    balance: 'Rp2.500.000',
                    color1: Color(0xFFB06AB3),
                    color2: Color(0xFF4568DC),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Beautiful Grid Menu =====
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: const [
                FancyMenuItem(
                  icon: Icons.health_and_safety,
                  label: 'Health',
                  color1: Color(0xFF43CEA2),
                  color2: Color(0xFF185A9D),
                ),
                FancyMenuItem(
                  icon: Icons.travel_explore,
                  label: 'Travel',
                  color1: Color(0xFF36D1DC),
                  color2: Color(0xFF5B86E5),
                ),
                FancyMenuItem(
                  icon: Icons.fastfood,
                  label: 'Food',
                  color1: Color(0xFFFF512F),
                  color2: Color(0xFFF09819),
                ),
                FancyMenuItem(
                  icon: Icons.event,
                  label: 'Event',
                  color1: Color(0xFFDA4453),
                  color2: Color(0xFF89216B),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ===== Transaction List =====
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Custom Fancy Menu Item Widget =====
class FancyMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color1;
  final Color color2;

  const FancyMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // diperkecil
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.white),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
