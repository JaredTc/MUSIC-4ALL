import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  SongModel? currentSong;
  bool isPlaying = false;

  Future<void> play(SongModel song) async {
    currentSong = song;
    await _player.play(DeviceFileSource(song.uri!));
    isPlaying = true;
    notifyListeners();
  }

  Future<void> pause() async {
    await _player.pause();
    isPlaying = false;
    notifyListeners();
  }
}
