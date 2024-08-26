import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_lite/data/models/song/song_model.dart';
import 'package:spotify_lite/domian/entities/song/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImp extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try{
      List<SongEntity> songList = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs").orderBy("id",descending:false)
          .limit(3)
          .get();
      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        songList.add(songModel.toEntity());
      }
      return Right(songList);
    }catch(e){
      print("erorr from firebase=============== $e");
      return const Left("An Error Occurred,Please try again");
    }
    }

  @override
  Future<Either> getPlayList()async {
    try{
      List<SongEntity> songList = [];
      var data = await FirebaseFirestore.instance
          .collection("Songs")
          .get();
      for(var element in data.docs){
        var songModel = SongModel.fromJson(element.data());
        songList.add(songModel.toEntity());
      }
      return Right(songList);
    }catch(e){
      print("erorr from firebase=============== $e");
      return const Left("An Error Occurred,Please try again");
    }
  }

}
