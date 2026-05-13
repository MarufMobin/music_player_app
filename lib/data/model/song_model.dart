import 'package:music_player_app/domain/entities/song.dart';

class SongModel extends Song {
  const SongModel({
    required super.title,
    required super.artist,
    required super.url,
    required super.durationSeconds,
  });

  static List<Song> getSampleSongs() {
    return const [
      SongModel(
        title: 'SoundHelix Song 1',
        artist: 'SoundHelix',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        durationSeconds: 356,
      ),

      SongModel(
        title: 'SoundHelix Song 2',
        artist: 'SoundHelix',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
        durationSeconds: 299,
      ),

      SongModel(
        title: 'SoundHelix Song 3',
        artist: 'SoundHelix',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
        durationSeconds: 321,
      ),
    ];
  }
}