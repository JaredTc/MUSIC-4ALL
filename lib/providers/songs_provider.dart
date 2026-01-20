import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsProvider extends ChangeNotifier {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  List<SongModel> songs = [];

  Future<void> loadSongs() async {
    bool permission = await _audioQuery.permissionsStatus();
    if (!permission) {
      permission = await _audioQuery.permissionsRequest();
    }

    if (permission) {
      songs = await _audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
      );
      notifyListeners();
    }
  }
}
