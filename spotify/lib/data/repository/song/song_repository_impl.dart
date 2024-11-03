import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firesbase_service.dart';
import 'package:spotify/domain/respository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) {
    // TODO: implement addOrRemoveFavoriteSongs
    throw UnimplementedError();
  }

  @override
  Future<Either> getNewsSongs() {
    return sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() {
    return sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> getUserFavoriteSongs() {
    // TODO: implement getUserFavoriteSongs
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavoriteSong(String songId) {
    // TODO: implement isFavoriteSong
    throw UnimplementedError();
  }

}