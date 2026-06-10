import 'package:just_audio/just_audio.dart';

class AudioService {
  AudioService._();

  static final AudioPlayer _player = AudioPlayer();

  static String? _currentAsset;
  static bool _isPlaying = false;

  static Future<void> play(String assetPath) async {
    try {
      // 🔥 prevent duplicate restart
      if (_currentAsset == assetPath && _isPlaying) {
        return;
      }

      await _player.stop();

      _currentAsset = assetPath;

      await _player.setAsset(assetPath);
      await _player.setLoopMode(LoopMode.one);

      await _player.play();

      _isPlaying = true;
    } catch (e) {
      _isPlaying = false;
      _currentAsset = null;
      print("AudioService play error: $e");
    }
  }

  static Future<void> stop() async {
    try {
      await _player.stop();
      _currentAsset = null;
      _isPlaying = false;
    } catch (e) {
      print("AudioService stop error: $e");
    }
  }

  static Future<void> pause() async {
    try {
      await _player.pause();
      _isPlaying = false;
    } catch (e) {
      print("AudioService pause error: $e");
    }
  }

  static bool get isPlaying => _isPlaying;

  static String? get currentAsset => _currentAsset;
}
