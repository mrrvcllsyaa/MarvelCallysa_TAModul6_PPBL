
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeksTerpilih = 0;

  final halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  void pilihHalaman(int indeks) {
    setState(() {
      indeksTerpilih = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.sizeOf(context).width;
    final layarLebar = lebar >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nusantara Cerdas Mobile'),
      ),
      drawer: NavigationDrawer(
        selectedIndex: indeksTerpilih,
        onDestinationSelected: (indeks) {
          Navigator.pop(context);
          pilihHalaman(indeks);
        },
        children: const [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Menu Utama',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.miscellaneous_services_outlined),
            selectedIcon: Icon(Icons.miscellaneous_services),
            label: Text('Layanan'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: Text('Warga'),
          ),
        ],
      ),
      body: Row(
        children: [
          if (layarLebar)
            NavigationRail(
              selectedIndex: indeksTerpilih,
              onDestinationSelected: pilihHalaman,
              labelType: NavigationRailLabelType.all,
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.miscellaneous_services_outlined),
                  selectedIcon: Icon(Icons.miscellaneous_services),
                  label: Text('Layanan'),
                ),
                NavigationRailDestination(
                  icon: BlocSelector<
                      PengajuanCubit, List<String>, int>(
                    selector: (daftar) => daftar.length,
                    builder: (context, total) {
                      return Badge(
                        isLabelVisible: total > 0,
                        label: Text('$total'),
                        child: const Icon(Icons.people_outline),
                      );
                    },
                  ),
                  selectedIcon: BlocSelector<
                      PengajuanCubit, List<String>, int>(
                    selector: (daftar) => daftar.length,
                    builder: (context, total) {
                      return Badge(
                        isLabelVisible: total > 0,
                        label: Text('$total'),
                        child: const Icon(Icons.people),
                      );
                    },
                  ),
                  label: const Text('Warga'),
                ),
              ],
            ),
          Expanded(
            child: IndexedStack(
              index: indeksTerpilih,
              children: halaman,
            ),
          ),
        ],
      ),
      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: indeksTerpilih,
              onDestinationSelected: pilihHalaman,
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.miscellaneous_services_outlined),
                  selectedIcon: Icon(Icons.miscellaneous_services),
                  label: 'Layanan',
                ),
                NavigationDestination(
                  icon: BlocSelector<
                      PengajuanCubit, List<String>, int>(
                    selector: (daftar) => daftar.length,
                    builder: (context, total) {
                      return Badge(
                        isLabelVisible: total > 0,
                        label: Text('$total'),
                        child: const Icon(Icons.people_outline),
                      );
                    },
                  ),
                  selectedIcon: BlocSelector<
                      PengajuanCubit, List<String>, int>(
                    selector: (daftar) => daftar.length,
                    builder: (context, total) {
                      return Badge(
                        isLabelVisible: total > 0,
                        label: Text('$total'),
                        child: const Icon(Icons.people),
                      );
                    },
                  ),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }
}
