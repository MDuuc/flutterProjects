import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/presentation/home/bloc/news_song_state.dart';

import '../../../service_locator.dart';

class NewsSongsCubit extends Cubit <NewsSongState> {
  // NewsSongsCubit(super.initialState);
  NewsSongsCubit(): super(NewsSongsLoading());
  
  Future<void> getNewsSongs() async{
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l){
        emit(NewsSongLoadFailure());
      },
      (data){
        emit(NewsSongLoaded(songs: data));
      }
      );
  }
}