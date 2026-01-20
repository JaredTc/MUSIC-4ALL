import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_for_all/ui/screens/exports.dart';
import 'package:music_for_all/ui/widgets/play_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _screens = const [DiscoverScreen(), PlayerScreen(), SettingsScreen()];

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),

      body: SafeArea(
        top: false,
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),

      bottomNavigationBar: ClipRRect(
        // borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: SafeArea(
            child: PlayBar(currentIndex: _currentIndex, onTap: _onNavTap),
          ),
        ),
      ),
    );
  }
}
