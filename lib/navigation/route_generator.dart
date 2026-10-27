import 'package:flutter/material.dart';

import '../pages/detail_layanan_page.dart';
import '../pages/not_found_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/detail-layanan':
        final args = settings.arguments;
        final namaLayanan = args is String
            ? args
            : 'Layanan Warga';

        return MaterialPageRoute<bool>(
          settings: settings,
          builder: (_) => DetailLayananPage(
            namaLayanan: namaLayanan,
          ),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NotFoundPage(),
        );
    }
  }

  static Route<dynamic> unknownRoute(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const NotFoundPage(),
    );
  }
}