import 'package:music_player_app/domain/entities/song.dart';

class SurahModel extends Surah {
  const SurahModel({
    required super.title,
    required super.artist,
    required super.url,
    required super.durationSeconds,
  });

  static List<Surah> getSampleSurah() {
    return const [
      SurahModel(
        title: 'Surah Al-Ikhlas',
        artist: 'Sheikh Mishary Rashid Alafasy',
        url:
        'https://server8.mp3quran.net/afs/112.mp3',
        durationSeconds: 25,
      ),

      SurahModel(
        title: 'Surah Al-Falaq',
        artist: 'Sheikh Maher Al-Muaiqly',
        url:
        'https://server12.mp3quran.net/maher/113.mp3',
        durationSeconds: 22,
      ),

      SurahModel(
        title: 'Surah An-Nas',
        artist: 'Sheikh Saud Al-Shuraim',
        url:
        'https://server7.mp3quran.net/shur/114.mp3',
        durationSeconds: 21,
      ),

      SurahModel(
        title: 'Surah Al-Kawthar',
        artist: 'Sheikh Ahmed Al-Ajmi',
        url:
        'https://server10.mp3quran.net/ajm/108.mp3',
        durationSeconds: 18,
      ),

      SurahModel(
        title: 'Surah Al-Asr',
        artist: 'Sheikh Saad Al-Ghamdi',
        url:
        'https://server7.mp3quran.net/s_gmd/103.mp3',
        durationSeconds: 16,
      ),

      SurahModel(
        title: 'Surah Ar-Rahman',
        artist: 'Sheikh Maher Al-Muaiqly',
        url:
        'https://server12.mp3quran.net/maher/055.mp3',
        durationSeconds: 478,
      ),

      SurahModel(
        title: 'Surah Al-Mulk',
        artist: 'Sheikh Saud Al-Shuraim',
        url:
        'https://server7.mp3quran.net/shur/067.mp3',
        durationSeconds: 510,
      ),
    ];
  }
}