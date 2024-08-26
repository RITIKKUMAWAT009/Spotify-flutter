import '../../../domian/entities/song/song_entity.dart';

abstract class NewsSongsState {
}

class NewsSongsLoading extends NewsSongsState{
}
class NewsSongsLoaded extends NewsSongsState{
final List<SongEntity>songs;
  NewsSongsLoaded({required this.songs});
}
class NewsSongsFailed extends NewsSongsState{
  final String message;
  NewsSongsFailed({required this.message});
}