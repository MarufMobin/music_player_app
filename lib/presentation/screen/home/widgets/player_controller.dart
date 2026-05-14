import 'package:flutter/material.dart';
import 'package:music_player_app/core/constants/app_colors.dart';
import 'package:music_player_app/presentation/screen/home/provider/media_provider.dart';
import 'package:provider/provider.dart';

class PlayerController extends StatelessWidget {
  const PlayerController({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        final currentSong = provider.currentSong;
        if (currentSong == null) {
          return SizedBox.shrink();
        }
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentSong.title,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),

              Text(
                currentSong.artist,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 16),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: AppColors.accent,
                  inactiveTrackColor: AppColors.textSecondary.withValues(
                    alpha: 0.2,
                  ),
                  thumbColor: AppColors.accent,
                  trackHeight: 4.0,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 14),
                ),
                child: Slider(
                  value: provider.position.inMilliseconds.toDouble().clamp(
                    0.0,
                    provider.duration.inMilliseconds.toDouble() > 0
                        ? provider.duration.inMilliseconds.toDouble()
                        : 1.0,
                  ),
                  onChanged: (value) {
                    provider.seek(Duration(milliseconds: value.toInt()));
                  },
                  min: 0.0,
                  max: provider.duration.inMilliseconds.toDouble() > 0
                      ? provider.duration.inMilliseconds.toDouble()
                      : 1.0,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formDuration(provider.position),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _formDuration(provider.duration),
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: provider.playPrevious,
                    icon: Icon(Icons.skip_previous,size: 35,color: AppColors.textPrimary,),
                  ),
                  SizedBox(width: 24,),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      onPressed: provider.playPause,
                      icon: Icon( provider.isPlaying ? Icons.pause : Icons.play_arrow, color: AppColors.textPrimary,size: 40,),

                    ),
                  ),
                  SizedBox(width: 24,),

                  IconButton(
                    onPressed: provider.playNext,
                    icon: Icon(Icons.skip_next,color: AppColors.textPrimary,size: 35,),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  String _formDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes : $seconds';
  }
}
