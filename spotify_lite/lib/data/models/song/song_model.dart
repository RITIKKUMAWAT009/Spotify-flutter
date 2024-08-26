import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_lite/domian/entities/song/song_entity.dart';

class SongModel {
  String? title;
  String? artist;
  double? duration;
  Timestamp? release;

  SongModel(
      {required this.title,
      required this.artist,
      required this.duration,
      required this.release});

  SongModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    artist = json['artist'];
    duration = json["duration"];
    release = json["release"];
  }
}

extension SongModelExtension on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        title: title!, artist: artist!, duration: duration!, release: release!);
  }
}
