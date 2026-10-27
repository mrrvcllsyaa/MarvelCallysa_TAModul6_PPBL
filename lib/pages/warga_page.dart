import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../cubit/theme_cubit.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        BagianFavorit(),
        SizedBox(height: 24),
        BagianPengajuan(),
        SizedBox(height: 24),
        PengaturanTema(),
      ],
    );
  }
}

class BagianFavorit extends StatelessWidget {
  const BagianFavorit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritCubit, Set<String>>(
      builder: (context, favorit) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Layanan Favorit',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (favorit.isEmpty)
              const Text('Belum ada layanan favorit.')
            else
              ...favorit.map(
                (nama) => Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    title: Text(nama),
                    trailing: IconButton(
                      tooltip: 'Hapus dari favorit',
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        context
                            .read<FavoritCubit>()
                            .batalTandai(nama);
                      },
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class BagianPengajuan extends StatelessWidget {
  const BagianPengajuan({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PengajuanCubit, List<String>>(
      builder: (context, daftar) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Keranjang Pengajuan (${daftar.length})',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            if (daftar.isEmpty)
              const Text('Belum ada layanan yang diajukan.')
            else ...[
              ...daftar.asMap().entries.map(
                (entry) => Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${entry.key + 1}'),
                    ),
                    title: Text(entry.value),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      tooltip: 'Hapus pengajuan',
                      onPressed: () {
                        context
                            .read<PengajuanCubit>()
                            .hapusPada(entry.key);
                      },
                    ),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  context.read<PengajuanCubit>().kosongkan();
                },
                icon: const Icon(Icons.delete_sweep),
                label: const Text('Kosongkan Keranjang'),
              ),
            ],
          ],
        );
      },
    );
  }
}

class PengaturanTema extends StatelessWidget {
  const PengaturanTema({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) {
        final gelap = mode == ThemeMode.dark;

        return Card(
          child: SwitchListTile(
            secondary: Icon(
              gelap ? Icons.dark_mode : Icons.light_mode,
            ),
            title: const Text('Mode Gelap'),
            subtitle: Text(
              gelap
                  ? 'Tampilan gelap aktif'
                  : 'Tampilan terang aktif',
            ),
            value: gelap,
            onChanged: (_) {
              context.read<ThemeCubit>().toggle();
            },
          ),
        );
      },
    );
  }
}