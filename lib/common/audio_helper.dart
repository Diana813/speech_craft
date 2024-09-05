import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
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
      await _player.play(UrlSource(url));
  }

  void dispose() async {
    _player.dispose();
    _recorder.dispose();
  }
}
