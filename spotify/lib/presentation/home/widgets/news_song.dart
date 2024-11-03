import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/domain/entities/song/song.dart';
import 'package:spotify/presentation/home/bloc/news_song_state.dart';
import 'package:spotify/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';

class NewsSong extends StatelessWidget {
  const NewsSong({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongState>(
        builder: (context, state) {
          if(state is NewsSongsLoading){
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator());
          }
          if(state is NewsSongLoaded){
            return _songs(
              state.songs
            );
          }
        return Container();
        }
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs){
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index){
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (BuildContext context) =>  SongPlayer(songEntity: songs[index],))
            );
        },
        child: SizedBox(
          width: 160,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(AppUrls.firestorage +songs[index].title + '-' +songs[index].artist + '.jpg?' + AppUrls.mediaAlt)
                      )
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      transform: Matrix4.translationValues(10, 10, 0),
                      child: Icon(
                        Icons.play_arrow_rounded,
                        color: context.IsDarkMode ? AppColors.darkGrey: Color(0xffe6e6e6) ,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.IsDarkMode ? const Color(0xff959595) : const Color(0xff555555),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text(
                songs[index].title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16
        
                ),
              ),
        
              SizedBox(height: 5,),
              Text(
                songs[index].artist,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12
        
                ),
              )
            ],
          ),
        ),
      );
    },
    separatorBuilder:(context, index){
      return SizedBox(width: 14,);
    },
    itemCount: songs.length,
          );
  }
}