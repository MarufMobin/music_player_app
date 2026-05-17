import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/data/model/song_model.dart';
import 'package:music_player_app/domain/entities/song.dart';

class MediaProvider extends ChangeNotifier {

  final AudioPlayer _audioPlayer = AudioPlayer();

  final List<Surah> _playList = SurahModel.getSampleSurah();

  int _currentIndex = 0;

  bool _isPlaying = false;

  Duration _duration = Duration.zero;

  Duration _position = Duration.zero;

  // =========================
  // GETTERS
  // =========================

  List<Surah> get playList => _playList;

  Surah? get currentSong =>
      _playList.isNotEmpty ? _playList[_currentIndex] : null;

  bool get isPlaying => _isPlaying;

  Duration get duration => _duration;

  Duration get position => _position;

  int get currentIndex => _currentIndex;

  // =========================
  // CONSTRUCTOR
  // =========================

  MediaProvider() {
    _initializeAudioPlayer();
  }

  // =========================
  // INITIALIZE LISTENERS
  // =========================

  void _initializeAudioPlayer() {

    // Total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      notifyListeners();
    });

    // Current position
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _position = newPosition;
      notifyListeners();
    });

    // Playing / Paused state
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });

    // Auto next song
    _audioPlayer.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  // =========================
  // PLAY SONG
  // =========================

  Future<void> _playCurrentSong() async {

    if (currentSong == null) return;

    try {

      _position = Duration.zero;

      await _audioPlayer.stop();

      await _audioPlayer.play(
        UrlSource(currentSong!.url),
      );

      notifyListeners();

    } catch (e) {
      debugPrint("Error playing song: $e");
    }
  }

  // =========================
  // PLAY SONG AT INDEX
  // =========================

  Future<void> playSongAtIndex(int index) async {

    if (index >= 0 && index < _playList.length) {

      _currentIndex = index;

      await _playCurrentSong();
    }
  }

  // =========================
  // PLAY / PAUSE
  // =========================

  Future<void> playPause() async {

    try {

      if (_isPlaying) {

        await _audioPlayer.pause();

      } else {

        // Resume if paused
        await _audioPlayer.resume();
      }

    } catch (e) {
      debugPrint("Play/Pause Error: $e");
    }
  }

  // =========================
  // NEXT SONG
  // =========================

  Future<void> playNext() async {

    if (_playList.isEmpty) return;

    _currentIndex = (_currentIndex + 1) % _playList.length;

    await _playCurrentSong();
  }

  // =========================
  // PREVIOUS SONG
  // =========================

  Future<void> playPrevious() async {

    if (_playList.isEmpty) return;

    _currentIndex =
        (_currentIndex - 1 + _playList.length) % _playList.length;

    await _playCurrentSong();
  }

  // =========================
  // SEEK
  // =========================

  Future<void> seek(Duration position) async {

    await _audioPlayer.seek(position);
  }

  // =========================
  // STOP
  // =========================

  Future<void> stop() async {

    await _audioPlayer.stop();

    _position = Duration.zero;

    _isPlaying = false;

    notifyListeners();
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void dispose() {

    _audioPlayer.dispose();

    super.dispose();
  }
}