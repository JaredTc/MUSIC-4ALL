import 'package:flutter/material.dart';
import 'package:music_for_all/core/theme/app_theme.dart';
import 'package:music_for_all/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'providers/player_provider.dart';
import 'providers/songs_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SongsProvider()),
        ChangeNotifierProvider(create: (_) => PlayerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music For All',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
