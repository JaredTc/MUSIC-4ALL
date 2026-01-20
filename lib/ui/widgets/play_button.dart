import 'package:flutter/material.dart';
import 'package:music_for_all/core/constants/colors.dart';

class PlayBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const PlayBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      // margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
        // color: const Color.fromARGB(118, 28, 28, 30).withOpacity(0.45),
        // borderRadius: BorderRadius.circular(30),
        // boxShadow: [
        //   BoxShadow(
        //     color: const Color.fromARGB(123, 0, 0, 0).withOpacity(0.4),
        //     blurRadius: 20,
        //     offset: const Offset(0, 10),
        //   ),
        // ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavButton(
            icon: Icons.library_music_outlined,
            active: currentIndex == 0,
            onTap: () => onTap(0),
          ),

          _PlayButton(
            icon: Icons.play_arrow_sharp,
            active: currentIndex == 1,
            onTap: () => onTap(1),
          ),

          _NavButton(
            icon: Icons.settings,
            active: currentIndex == 2,
            onTap: () => onTap(2),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  const _NavButton({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: active ? AppColors.accent : AppColors.card,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: active ? Colors.black : Colors.white,
          size: 26,
        ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final IconData icon;
  final bool active;
  final VoidCallback onTap;

  const _PlayButton({
    required this.icon,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: active ? AppColors.accent : AppColors.card,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: active ? Colors.black : Colors.white,
          size: 26,
        ),
      ),
    );
  }
}
