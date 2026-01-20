import 'package:flutter/material.dart';
import 'package:music_for_all/providers/songs_provider.dart';
import 'package:music_for_all/ui/widgets/exports_widgets.dart';
import 'package:music_for_all/ui/widgets/text_vertical.dart';
import 'package:provider/provider.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SongsProvider>().loadSongs();
  }

  @override
  Widget build(BuildContext context) {
    final songsProvider = context.watch<SongsProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const DiscoverHeader(),

          // 🧱 CONTENIDO BASE
          SafeArea(
            bottom: false,
            child: Column(
              children: [
                //  espacio reservado para el scroll horizontal
                const SizedBox(height: 400),

                Expanded(
                  child: songsProvider.songs.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                          itemCount: songsProvider.songs.length,
                          itemBuilder: (_, i) {
                            final song = songsProvider.songs[i];
                            return SongListItem(
                              id: song.id,
                              title: song.title,
                              subtitle: song.artist ?? 'Unknown Artist',
                              duration: song.duration ?? 0,
                              uri: song.uri ?? '',
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          Positioned(top: 130, left: 20, child: const TextVertical()),
          //  CARD HORIZONTAL FLOTANTE
          const Positioned(
            top: 120, // debajo del header
            left: 0,
            right: 0,
            child: ScrollLeft(),
          ),
        ],
      ),
    );
  }
}
