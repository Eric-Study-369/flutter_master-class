import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial/models/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

//create CRUD operator

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  //I N I T TALIZE - DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //list of notes
  final List<Note> currentNote = [];

  //C R E A T - a note and save to db

  Future<void> addNote(String textFromUser) async {
    // create a new note object
    final newNote = Note()..text = textFromUser;

    //save to database
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read from db or refres db 
    fetchNotes();
  }

  //R E A D - note from db
  Future<void> fetchNotes() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchNotes);
    notifyListeners();
  }

  //U P D T E - a note in db
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //D E L E T E- a note from the db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
