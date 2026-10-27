import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  static const List<Map<String, dynamic>> pilar = [
    {
      'nama': 'Smart Governance',
      'ikon': Icons.account_balance,
    },
    {
      'nama': 'Smart Branding',
      'ikon': Icons.travel_explore,
    },
    {
      'nama': 'Smart Economy',
      'ikon': Icons.storefront,
    },
    {
      'nama': 'Smart Living',
      'ikon': Icons.health_and_safety,
    },
    {
      'nama': 'Smart Society',
      'ikon': Icons.groups,
    },
    {
      'nama': 'Smart Environment',
      'ikon': Icons.eco,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          'Selamat Datang!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        const Text(
          'Nusantara Cerdas Mobile membantu warga '
          'mengakses layanan kota dengan mudah.',
        ),
        const SizedBox(height: 24),
        Text(
          'Enam Pilar Smart City',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ...pilar.map(
          (item) => Card(
            child: ListTile(
              leading: Icon(item['ikon'] as IconData),
              title: Text(item['nama'] as String),
              subtitle: const Text(
                'Mendukung kota yang cerdas dan terintegrasi.',
              ),
            ),
          ),
        ),
      ],
    );
  }
}