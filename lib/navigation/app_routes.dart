
import 'package:flutter/material.dart';

import '../pages/detail_layanan_page.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String layanan = '/layanan';
  static const String warga = '/warga';
  static const String detailLayanan = '/detail-layanan';

  static Route<dynamic> bentukRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case beranda:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KerangkaRouteBeranda(),
        );

      case layanan:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KerangkaRouteLayanan(),
        );

      case warga:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KerangkaRouteWarga(),
        );

      case detailLayanan:
        final nama = settings.arguments as String? ??
            'Layanan Warga';

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailLayananPage(
            namaLayanan: nama,
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('404 - Halaman tidak ditemukan'),
            ),
          ),
        );
    }
  }

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('404 - Halaman tidak ditemukan'),
        ),
      ),
    );
  }
}

// Halaman utama dirender melalui kerangka navigasi yang sama.
class KerangkaRouteBeranda extends StatelessWidget {
  const KerangkaRouteBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HalamanDalamKerangka(indeks: 0);
  }
}

class KerangkaRouteLayanan extends StatelessWidget {
  const KerangkaRouteLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HalamanDalamKerangka(indeks: 1);
  }
}

class KerangkaRouteWarga extends StatelessWidget {
  const KerangkaRouteWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HalamanDalamKerangka(indeks: 2);
  }
}

class _HalamanDalamKerangka extends StatelessWidget {
  final int indeks;

  const _HalamanDalamKerangka({
    required this.indeks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Gunakan KerangkaNavigasi sebagai halaman utama.',
        ),
      ),
    );
  }
}
