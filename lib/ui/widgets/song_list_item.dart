import 'package:flutter/material.dart';
import 'package:music_for_all/util/format_duration.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongListItem extends StatelessWidget {
  final int id;
  final String uri;
  final String title;
  final String subtitle;
  final int duration;
  const SongListItem({
    super.key,
    required this.id,
    required this.uri,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QueryArtworkWidget(
          id: id,
          type: ArtworkType.AUDIO,
          artworkHeight: 56,
          artworkWidth: 56,
          artworkBorder: BorderRadius.circular(8),
          nullArtworkWidget: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(19),
            ),
            child: const Icon(Icons.music_note, color: Colors.white70),
          ),
        ),

        // const Icon(Icons.music_note, color: Colors.white),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
        Text(
          formatDuration(duration),
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
