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
        title: 'Dreams',
        artist: 'Joakim Karud',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
        durationSeconds: 356,
      ),

      SongModel(
        title: 'Summer Vibes',
        artist: 'Luke Bergs',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
        durationSeconds: 299,
      ),

      SongModel(
        title: 'Chill Night',
        artist: 'A Himitsu',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
        durationSeconds: 321,
      ),

      SongModel(
        title: 'Morning Coffee',
        artist: 'LiQWYD',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
        durationSeconds: 287,
      ),

      SongModel(
        title: 'Ocean Drive',
        artist: 'MBB',
        url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
        durationSeconds: 412,
      ),
    ];
  }
}