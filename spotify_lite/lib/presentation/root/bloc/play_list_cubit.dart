import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/domian/usecases/song/get_play_list.dart';
import 'package:spotify_lite/presentation/root/bloc/play_list_state.dart';

import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState>{
  PlayListCubit():super(PlayListLoading());

  Future<void>getPlayList()async{

    var returnedSongs=await sl<GetPlayListUseCase>().call();
    returnedSongs.fold((l) {
      emit(PlayListFailed(message: l));
    },(data) {
      emit(PlayListLoaded(songs: data));
    },);

  }
}