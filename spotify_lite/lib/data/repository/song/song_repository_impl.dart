import 'package:dartz/dartz.dart';
import 'package:spotify_lite/domian/repository/song/song_repo.dart';

import '../../../service_locator.dart';
import '../../sources/song/song_firebase_service.dart';

class SongRepositoryImpl extends SongRepo{
  @override
  Future<Either> getNewsSongs()async{
   return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async{
    return await sl<SongFirebaseService>().getPlayList();

  }

}