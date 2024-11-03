import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/presentation/home/bloc/play_list_state.dart';

import '../../../service_locator.dart';

class PlayListCubit extends Cubit <PlayListState> {
  // PlayListCubit(super.initialState);
  PlayListCubit(): super(PlayListLoading());
  
  Future<void> getPlayLists() async{
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (l){
        emit(PlayListLoadFailure());
      },
      (data){
        emit(PlayListLoaded(songs: data));
      }
      );
  }
}