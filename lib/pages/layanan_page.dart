import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  static const Map<String, List<Map<String, String>>> dataLayanan = {
    'Perizinan': [
      {
        'nama': 'Pembuatan KTP',
        'deskripsi': 'Permohonan pembuatan KTP.',
      },
      {
        'nama': 'Perpanjangan SIM',
        'deskripsi': 'Informasi perpanjangan SIM.',
      },
    ],
    'Kesehatan': [
      {
        'nama': 'Pendaftaran Puskesmas',
        'deskripsi': 'Layanan pendaftaran puskesmas.',
      },
      {
        'nama': 'Jadwal Imunisasi',
        'deskripsi': 'Informasi jadwal imunisasi.',
      },
    ],
    'Transportasi': [
      {
        'nama': 'Informasi Transportasi',
        'deskripsi': 'Informasi transportasi umum.',
      },
      {
        'nama': 'Pengaduan Jalan',
        'deskripsi': 'Laporkan masalah jalan.',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: dataLayanan.length,
      child: Column(
        children: [
          Material(
            color: Theme.of(context).colorScheme.surface,
            child: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Perizinan'),
                Tab(text: 'Kesehatan'),
                Tab(text: 'Transportasi'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: dataLayanan.values.map((daftar) {
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: daftar.length,
                  itemBuilder: (context, index) {
                    final layanan = daftar[index];
                    final nama = layanan['nama']!;

                    return Card(
                      child: ListTile(
                        leading: const Icon(
                          Icons.miscellaneous_services,
                        ),
                        title: Text(nama),
                        subtitle: Text(layanan['deskripsi']!),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail-layanan',
                            arguments: nama,
                          );
                        },
                        trailing: BlocBuilder<
                            FavoritCubit, Set<String>>(
                          builder: (context, favorit) {
                            final aktif = favorit.contains(nama);

                            return IconButton(
                              tooltip: aktif
                                  ? 'Hapus favorit'
                                  : 'Tambah favorit',
                              onPressed: () {
                                context
                                    .read<FavoritCubit>()
                                    .toggle(nama);
                              },
                              icon: Icon(
                                aktif
                                    ? Icons.star
                                    : Icons.star_border,
                                color: aktif
                                    ? Colors.amber
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}