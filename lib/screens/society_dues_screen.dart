import 'package:flutter/material.dart';

class SocietyDuesPage extends StatelessWidget {
  const SocietyDuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Society Dues',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        elevation: 4.0, // This will add a shadow below the AppBar
        shadowColor: Colors.black.withOpacity(
            0.5), // Optional: customize the shadow color and opacity
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    color: Colors.blue,
                    icon: Icons.account_balance_wallet,
                    title: 'Total Dues',
                    amount: '\$1234.56',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DashboardCard(
                    color: Colors.green,
                    icon: Icons.check_circle,
                    title: 'Paid Dues',
                    amount: '\$800.00',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const DashboardCard(
              color: Colors.red,
              icon: Icons.warning,
              title: 'Unpaid Dues',
              amount: '\$434.56',
            ),
            const SizedBox(height: 16),
            const Text('History'),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // replace with dynamic item count
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 2.0,
                    child: ListTile(
                      title: Text('Maintenance Fee ${index + 1}'),
                      subtitle: const Text('Due Date: 30th July 2024'),
                      trailing: const Text(
                        '\$250',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String amount;

  const DashboardCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.white),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
