import '../../../domian/entities/song/song_entity.dart';

abstract class PlayListState{}


class PlayListLoading extends PlayListState{}

class PlayListLoaded extends PlayListState{
  final List<SongEntity> songs;
  PlayListLoaded({required this.songs});
}

class PlayListFailed extends PlayListState{
  final String message;
  PlayListFailed({required this.message});
}