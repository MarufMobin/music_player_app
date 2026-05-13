import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app/data/model/song_model.dart';
import 'package:music_player_app/domain/entities/song.dart';

class MediaProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final List<Song> _playList = SongModel.getSampleSongs();

  int _currentIndex = 0;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  List<Song> get playList => _playList;

  Song? get currentSong =>
      _playList.isNotEmpty ? _playList[_currentIndex] : null;

  bool get isPlaying => _isPlaying;

  Duration get duration => _duration;

  Duration get position => _position;

  MediaProvider() {
    _initialAudioPlayer();
  }

  void _initialAudioPlayer() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _duration = newDuration;
      notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((newPosition){
        _position = newPosition;
        notifyListeners();
    });

    _audioPlayer.onPositionChanged.listen((state){
        _isPlaying = state == PlayerState.playing;
        notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event){});

    if( _playList.isNotEmpty){}
  }



}
