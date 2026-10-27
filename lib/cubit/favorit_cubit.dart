import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritCubit extends Cubit<Set<String>> {
  FavoritCubit() : super(<String>{});

  void tandai(String namaLayanan) {
    if (state.contains(namaLayanan)) return;
    emit({...state, namaLayanan});
  }

  void batalTandai(String namaLayanan) {
    if (!state.contains(namaLayanan)) return;
    emit({...state}..remove(namaLayanan));
  }

  void toggle(String namaLayanan) {
    if (state.contains(namaLayanan)) {
      batalTandai(namaLayanan);
    } else {
      tandai(namaLayanan);
    }
  }
}