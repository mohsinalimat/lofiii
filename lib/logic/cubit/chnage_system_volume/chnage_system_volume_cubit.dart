// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:volume_controller/volume_controller.dart';

part 'chnage_system_volume_state.dart';

class ChangeSystemVolumeCubit extends Cubit<ChangeSystemVolumeState> {
  final VolumeController volumeController;
  ChangeSystemVolumeCubit({required this.volumeController})
      : super(ChangeSystemVolumeState(volume: 5.0));

  ///Change System Volume
  void change(
      {required DragUpdateDetails details,
      required BuildContext context}) async {
    double delta = details.primaryDelta! / -350;
    state.volume += delta;

    if (state.volume < 0.0) {
      emit(state.copyWith(volume: 0.0));
    } else if (state.volume > 1.0) {
      emit(state.copyWith(volume: 1.0));
    }

    emit(state.copyWith(volume: state.volume));

    ///!----System Volume Change
    volumeController.setVolume(state.volume);
  }
}
