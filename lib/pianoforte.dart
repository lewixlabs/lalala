import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

abstract class Piano {
  void playNote(PianoNote note);
}

enum PianoNote { c, d, e, f, g, a, b }

class LalalaPiano implements Piano {

  final Soundpool _pool = Soundpool(streamType: StreamType.music);
  AudioStreamControl _audioStreamControl;
  Map<PianoNote, int> _noteMap;
  int _lastStreamId = null;


  void loadNotes() async {

    _noteMap = {
      PianoNote.c: await rootBundle.load("assets/notes/piano_c.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.d: await rootBundle.load("assets/notes/piano_d.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.e: await rootBundle.load("assets/notes/piano_e.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.f: await rootBundle.load("assets/notes/piano_f.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.g: await rootBundle.load("assets/notes/piano_g.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.a: await rootBundle.load("assets/notes/piano_a.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
      PianoNote.b: await rootBundle.load("assets/notes/piano_b.wav").then((ByteData soundData) {
        return _pool.load(soundData);
      }),
    };
  }

  @override
  void playNote(PianoNote note) async {

    if (_audioStreamControl?.stream != null && _audioStreamControl?.stream == _lastStreamId)
      _pool.stop(_lastStreamId);

    _audioStreamControl = await _pool.playWithControls(_noteMap[note]);
    _lastStreamId = _audioStreamControl?.stream;
  }
}
