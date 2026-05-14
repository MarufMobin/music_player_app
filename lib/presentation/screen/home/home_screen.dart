import 'package:flutter/material.dart';
import 'package:music_player_app/core/constants/app_colors.dart';
import 'package:music_player_app/core/constants/app_strings.dart';
import 'package:music_player_app/presentation/screen/home/provider/media_provider.dart';
import 'package:music_player_app/presentation/screen/home/widgets/player_controller.dart';
import 'package:music_player_app/presentation/screen/home/widgets/song_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        // title: const Text(
        //   AppStrings.appName,
        //   style: TextStyle(
        //     color: AppColors.textPrimary,
        //     fontWeight: FontWeight.bold,
        //     fontSize: 36,
        //   ),
        // ),
        centerTitle: true,
        backgroundColor: AppColors.surface,
      ),

      body: Column(
        children: [
          PlayerController(),

          Expanded(
            child: Consumer<MediaProvider>(
              builder: (context, provider, child) {
                final playList = provider.playList;
                return ListView.builder(
                  itemCount: provider.playList.length,
                  itemBuilder: (context, index) {
                    final song = playList[index];
                    final isSelected = index == provider.currentIndex;
                    return SongListItem(
                      song: song,
                      index: index,
                      isPlaying: provider.isPlaying,
                      isSelected: isSelected,
                      onTap: () async {
                        await provider.playSongAtIndex(index);
                        debugPrint('Tapped: $index');
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
