import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_cubit.dart';
import 'package:spotify/presentation/song_player/bloc/song_player_state.dart';

class SongPlayer extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayer({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          'Now Playing',
          style: TextStyle(
            fontSize: 18
          ),
        ),
        action: IconButton(
          onPressed: (){}, 
          icon: Icon(
            Icons.more_vert_rounded
          )
          ),
      ),
      body: BlocProvider(
        create: (_) => SongPlayerCubit()..loadSong(
          '${AppUrls.firestorage} ${songEntity.title}-${songEntity.artist}.mp3? ${AppUrls.mediaAlt}'
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _songCover(context),
                const SizedBox(height: 20,),
                _songDetail(),
                const SizedBox(height: 20,),
                _songPlayer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
  Widget _songCover(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(AppUrls.firestorage +songEntity.title + '-' +songEntity.artist + '.jpg?' + AppUrls.mediaAlt)
        )
      ),
    );
  }

  Widget _songDetail(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              songEntity.artist,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            
          ],
        ),
        IconButton
        (onPressed: (){}, 
        icon: Icon(
          Icons.favorite_outline_outlined,
          color: AppColors.darkGrey,
        )
        )
      ],
    );
  }

  Widget _songPlayer(BuildContext context){
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state){
        if(state is SongPlayerLoading){
          return const CircularProgressIndicator();
        }
        if(state is SongPlayerLoaded ){
          return Column(
            children: [
              Slider(
                value: context.read<SongPlayerCubit>().songPosition.inSeconds.toDouble(),
                min: 0.0,
                max: context.read<SongPlayerCubit>().songDuration.inSeconds.toDouble(),
                onChanged: (value){},
                )
            ],
          );
        }
        return Container();
      }
      );
  }
}