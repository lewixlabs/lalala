import 'package:audioplayers/audio_cache.dart';

abstract class Piano {
  void playNote(PianoNote note);
  //void releaseNote(); TODO?
}

enum PianoNote { c, d, e, f, g, a, b }

class LalalaPiano implements Piano {
  final AudioCache _player = AudioCache(prefix: "notes/");

  final Map<PianoNote, String> _noteMap = {
    PianoNote.c: "piano_c.wav",
    PianoNote.d: "piano_d.wav",
    PianoNote.e: "piano_e.wav",
    PianoNote.f: "piano_f.wav",
    PianoNote.g: "piano_g.wav",
    PianoNote.a: "piano_a.wav",
    PianoNote.b: "piano_b.wav",
  };

  void loadNotes() => _player.loadAll(_noteMap.values.toList());

  @override
  void playNote(PianoNote note) => _player.play(_noteMap[note]);
}
