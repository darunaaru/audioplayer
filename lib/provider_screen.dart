import 'package:audioplayer/model_screen.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:provider/provider.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final List<AudioFile> audioFiles = [
    AudioFile(filePath: 'assets/audio/anuvynakaalam.mp3'),
    AudioFile(filePath: 'assets/audio/dingiridingale.mp3'),
    AudioFile(filePath: 'assets/audio/ediparavasamo.mp3'),
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  void toggleAudioFile(int index) async {
    final audioFile = audioFiles[index];

    if (audioFile.isPlaying) {
      await audioPlayer.pause();
      audioFile.isPlaying = false;
    } else {
      await audioPlayer.resume();
      audioFile.isPlaying = true;
    }

    notifyListeners();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
