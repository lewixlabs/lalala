import 'package:flutter/material.dart';
import 'pianoforte.dart';

class NotePage extends StatelessWidget {
  final LalalaPiano _pianoPlayer = LalalaPiano();
  final int _currentNotesQuantity;

  NotePage(this._currentNotesQuantity) {
    _pianoPlayer.loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedNoteGrid(_pianoPlayer, NoteGrid(_currentNotesQuantity));
  }
}

class InheritedNoteGrid extends InheritedWidget {
  final LalalaPiano player;

  InheritedNoteGrid(this.player, child) : super(child: child);

  static InheritedNoteGrid of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedNoteGrid);

  @override
  bool updateShouldNotify(InheritedNoteGrid old) => player != player;
}

class NoteGrid extends StatelessWidget {
  final int _notesQuantity;
  int _idxNote = 0;

  NoteGrid(this._notesQuantity);

  PianoNote _nextNote() {
    PianoNote nextNote;

    switch (_idxNote) {
      case 0:
        nextNote = PianoNote.c;
        break;

      case 1:
        nextNote = PianoNote.d;
        break;

      case 2:
        nextNote = PianoNote.e;
        break;

      case 3:
        nextNote = PianoNote.f;
        break;

      case 4:
        nextNote = PianoNote.g;
        break;

      case 5:
        nextNote = PianoNote.a;
        break;

      case 6:
        nextNote = PianoNote.b;
        _idxNote = 0;
        break;

      default:
        nextNote = PianoNote.c;
        break;
    }

    _idxNote++;

    return nextNote;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
          _notesQuantity,
          (_) => Expanded(
                  child: Note(
                sound: _nextNote(),
              ))),
    );
  }
}

class Note extends StatelessWidget {
  final PianoNote sound;

  Note({@required this.sound}) : assert(sound != null);

  @override
  Widget build(BuildContext context) {
    //final currentPlayer = NoteGrid.of(context).player;

    return InkWell(
      onTap: () => InheritedNoteGrid.of(context).player.playNote(this.sound),
      splashColor: Colors.pink,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]), color: Colors.white),
      ),
    );
  }
}
