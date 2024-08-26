import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_lite/domian/usecases/song/get_news_songs.dart';
import 'package:spotify_lite/presentation/root/bloc/news_songs_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState>{
  NewsSongsCubit():super(NewsSongsLoading());

  Future<void>getNewsSongs()async{
    print("get news songs called");
    var returnedSongs=await sl<GetNewsSongsUseCase>().call();
    returnedSongs.fold((l) {
      print("message is =======>>>"+l);
      emit(NewsSongsFailed(message:l));
    }, (data) {
      print("data is ------->>>>"+data.toString());
    emit( NewsSongsLoaded(songs:data));
    },);

  }
}