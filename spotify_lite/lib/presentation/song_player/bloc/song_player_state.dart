abstract class SongPlayerState{}

class SongPlayerLoading extends SongPlayerState{}

class SongPlayerLoaded extends SongPlayerState{}

class SongPlayerFailed extends SongPlayerState
{
  final String message;

  SongPlayerFailed({required this.message});
}