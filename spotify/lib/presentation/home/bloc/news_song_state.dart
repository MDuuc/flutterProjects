import 'package:spotify/domain/entities/song/song.dart';

abstract class NewsSongState {}

class NewsSongsLoading extends NewsSongState{}

class NewsSongLoaded extends NewsSongState{
  final List<SongEntity> songs;
  NewsSongLoaded({required this.songs});
}

class NewsSongLoadFailure extends NewsSongState{}