import 'package:flutter/material.dart';
import 'package:music_for_all/core/constants/colors.dart';

class TextVertical extends StatelessWidget {
  const TextVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.library_music_outlined, color: AppColors.card, size: 20),
        const SizedBox(height: 8),
        RotatedBox(
          quarterTurns: 3, // 270° (abajo hacia arriba)
          child: Text(
            'Your Playlist',
            style: TextStyle(
              fontFamily: 'EuclidCircular',
              color: AppColors.card,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
