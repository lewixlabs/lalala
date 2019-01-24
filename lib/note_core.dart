import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class NotePage extends StatelessWidget {
  final AudioCache _player = new AudioCache();
  final int _currentNotesQuantity;
  
  NotePage(this._currentNotesQuantity) {
    _player.load("piano_c.wav");
  }

  @override
  Widget build(BuildContext context) {
    return new InheritedNoteGrid(_player, NoteGrid(_currentNotesQuantity));
  }
}

class InheritedNoteGrid extends InheritedWidget {
  final AudioCache player;

  InheritedNoteGrid(this.player, child): super(child: child);

  static InheritedNoteGrid of(BuildContext context) =>
    context.inheritFromWidgetOfExactType(InheritedNoteGrid);
  
  @override
  bool updateShouldNotify(InheritedNoteGrid old) =>
    player != player;
}

class NoteGrid extends StatelessWidget {
  final int _notesQuantity;

  NoteGrid(this._notesQuantity);

  @override
  Widget build(BuildContext context) {

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(_notesQuantity, (_) => Expanded(child: Note())),
    );
  }
}

class Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final currentPlayer = NoteGrid.of(context).player;

    return InkWell(
      onTap: () => InheritedNoteGrid.of(context).player.play("piano_c.wav"),
      splashColor: Colors.pink,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]), color: Colors.white),
      ),
    );
  }
}