import 'dart:typed_data';

import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';

class AudioHelper {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  Future<Stream<Uint8List>> record() async {
    if (await _recorder.hasPermission()) {
      try {
        final stream = await _recorder
            .startStream(const RecordConfig(encoder: AudioEncoder.pcm16bits));
        return stream;
      } catch (e) {
        print(e);
        throw Exception(e);
      }
    } else {
      throw Exception('No permission to record audio');
    }
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
  }

  Future<void> play(String url) async {
    await _player.setUrl(url);
    await _player.play();
  }

  void dispose() {
    _player.dispose();
    _recorder.dispose();
  }
}